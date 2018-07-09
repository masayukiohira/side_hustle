class AddInverseFollowerIdFromFollows < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :inverse_follower_id, :integer
  end
end
