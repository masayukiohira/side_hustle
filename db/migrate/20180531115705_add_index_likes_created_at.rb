class AddIndexLikesCreatedAt < ActiveRecord::Migration[5.1]
  def change
  	add_index :likes, :created_at
  end
end
