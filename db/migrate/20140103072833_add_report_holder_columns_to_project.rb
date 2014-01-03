class AddReportHolderColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :report_holder, :string
  end
end
