class AddIndexCommentsUserId < ActiveRecord::Migration[5.1]
  def change
  	add_index :comments, :user_id
  end
end
