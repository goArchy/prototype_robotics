class AddSlugToSpreeProjects < ActiveRecord::Migration
  def change
    add_column :spree_projects, :slug, :string
    add_index :spree_projects, :slug, unique: true
  end
end
