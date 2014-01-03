class AddBioinformaticsOperatorCompleteDateColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :bioinformatics_operator,      :string
    add_column :projects, :bioinformatics_complete_date, :date
  end
end
