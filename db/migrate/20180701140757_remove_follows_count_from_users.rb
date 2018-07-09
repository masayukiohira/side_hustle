class RemoveFollowsCountFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :follows_count, :integer
  end
end
