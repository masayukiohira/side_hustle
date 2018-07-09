class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
