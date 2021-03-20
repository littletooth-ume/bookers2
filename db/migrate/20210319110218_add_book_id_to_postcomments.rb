class AddBookIdToPostcomments < ActiveRecord::Migration[5.2]
  def change
    add_column :postcomments, :book_id, :integer
  end
end
