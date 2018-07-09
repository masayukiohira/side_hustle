class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :title
      t.text :name
      t.text :email_address
      t.text :password
      t.text :introduction
      t.text :image_id
      t.text :status

      t.timestamps
    end
  end
end
