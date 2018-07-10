class AddIndexToComments < ActiveRecord::Migration[5.1]
  def change
  	remove_index :comments, :body
  end
end
