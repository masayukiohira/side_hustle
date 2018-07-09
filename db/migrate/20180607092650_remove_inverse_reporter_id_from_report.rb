class RemoveInverseReporterIdFromReport < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :inverse_reporter_id, :integer
  end
end
