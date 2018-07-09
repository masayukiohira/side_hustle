class AddReporterIdToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :reporter_id, :integer
  end
end
