class AddUnsubscribeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :unsubscribe, :boolean, default: false, null: false
  end
end
