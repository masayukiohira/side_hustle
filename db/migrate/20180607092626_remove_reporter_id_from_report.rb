class RemoveReporterIdFromReport < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :reporter_id, :integer
  end
end
