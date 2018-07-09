class AddInverseReporterIdToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :inverse_reporter_id, :integer
  end
end
