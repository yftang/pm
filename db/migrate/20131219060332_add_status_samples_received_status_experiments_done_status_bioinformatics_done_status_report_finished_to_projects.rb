class AddStatusSamplesReceivedStatusExperimentsDoneStatusBioinformaticsDoneStatusReportFinishedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :status_samples_received,    :string
    add_column :projects, :status_experiments_done,    :string
    add_column :projects, :status_bioinformatics_done, :string
    add_column :projects, :status_report_finished,     :string
  end
end
