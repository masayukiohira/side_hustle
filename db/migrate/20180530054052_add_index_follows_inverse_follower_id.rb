class AddIndexFollowsInverseFollowerId < ActiveRecord::Migration[5.1]
  def change
  	add_index :follows, :inverse_follower_id
  end
end
