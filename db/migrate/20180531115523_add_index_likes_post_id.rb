class AddIndexLikesPostId < ActiveRecord::Migration[5.1]
  def change
  	add_index :likes, :post_id
  end
end
