class RemoveEmailAddressFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email_address, :text
  end
end
