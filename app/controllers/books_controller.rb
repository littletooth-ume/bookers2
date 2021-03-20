class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render template: "users/show"
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if not @book.user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
