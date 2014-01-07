class AddOperatorCompleteDateColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :experiment_operator,      :string
    add_column :projects, :experiment_complete_date, :date
  end
end
