class AddIndexReportsInverseReporterId < ActiveRecord::Migration[5.1]
  def change
  	add_index :reports, :inverse_reporter_id
  end
end
