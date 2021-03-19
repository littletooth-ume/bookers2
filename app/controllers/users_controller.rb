class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    if not @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
