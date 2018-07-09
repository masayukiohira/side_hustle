class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.text :name
      t.text :email_address
      t.text :password
      t.text :image_id

      t.timestamps
    end
  end
end
