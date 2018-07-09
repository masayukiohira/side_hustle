class CreateDirectMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :direct_messages do |t|
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
