class AddDefaultFalseOnProjects < ActiveRecord::Migration
  def change
    change_column :projects, :published, :boolean, :default => false
    change_column :projects, :featured, :boolean, :default => false
  end
end
