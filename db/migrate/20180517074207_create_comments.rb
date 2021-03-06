class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :body

      t.timestamps
    end
  end
end
