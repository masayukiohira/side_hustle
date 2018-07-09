class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :follower_id
      t.integer :following_id
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
