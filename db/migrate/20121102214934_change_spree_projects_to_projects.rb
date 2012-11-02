class ChangeSpreeProjectsToProjects < ActiveRecord::Migration
  def change
    rename_table :spree_projects, :projects
  end
end
