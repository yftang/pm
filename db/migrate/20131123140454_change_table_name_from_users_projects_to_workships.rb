class ChangeTableNameFromUsersProjectsToWorkships < ActiveRecord::Migration
  def change
    rename_table :users_projects, :workships
  end
end
