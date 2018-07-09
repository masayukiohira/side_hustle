class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.text :title
      t.text :body
      t.text :image_id
      t.integer :likes_count
      t.integer :comments_count

      t.timestamps
    end
  end
end
