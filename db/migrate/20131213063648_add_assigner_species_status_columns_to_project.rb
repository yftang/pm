class AddAssignerSpeciesStatusColumnsToUser < ActiveRecord::Migration
  def change
    add_column :projects, :assigner, :string
    add_column :projects, :species,  :string
    add_column :projects, :status,   :string
  end
end
