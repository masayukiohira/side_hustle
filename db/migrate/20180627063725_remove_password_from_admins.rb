class RemovePasswordFromAdmins < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :password, :text
  end
end
