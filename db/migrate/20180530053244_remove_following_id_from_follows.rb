class RemoveFollowingIdFromFollows < ActiveRecord::Migration[5.1]
  def change
    remove_column :follows, :following_id, :integer
  end
end
