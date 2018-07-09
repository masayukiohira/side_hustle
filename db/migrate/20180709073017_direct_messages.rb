class DirectMessages < ActiveRecord::Migration[5.1]
  def change
  	drop_table :direct_messages
  end
end
