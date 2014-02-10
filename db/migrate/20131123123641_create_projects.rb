class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :acc
      t.date :start_date
      t.date :dead_line
      t.string :description

      t.timestamps
    end
    add_index :projects, [:acc]
  end
end
