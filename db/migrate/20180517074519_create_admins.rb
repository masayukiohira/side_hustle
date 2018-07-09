class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :name
      t.text :email_address
      t.text :password
      t.text :image_id

      t.timestamps
    end
  end
end
