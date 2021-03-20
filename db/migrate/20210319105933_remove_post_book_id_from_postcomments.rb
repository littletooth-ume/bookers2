class RemovePostBookIdFromPostcomments < ActiveRecord::Migration[5.2]
  def change
    remove_column :postcomments, :post_book_id, :integer
  end
end
