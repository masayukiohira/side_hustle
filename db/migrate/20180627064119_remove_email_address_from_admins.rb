class RemoveEmailAddressFromAdmins < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :email_address, :text
  end
end
