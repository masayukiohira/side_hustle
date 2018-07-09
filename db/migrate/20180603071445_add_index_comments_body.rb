class AddIndexCommentsBody < ActiveRecord::Migration[5.1]
  def change
  	add_index :comments, :body
  end
end
