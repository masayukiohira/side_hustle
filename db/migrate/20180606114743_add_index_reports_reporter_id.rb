class AddIndexReportsReporterId < ActiveRecord::Migration[5.1]
  def change
  	add_index :reports, :reporter_id
  end
end
