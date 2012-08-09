class AddSlugToSpreeTutorials < ActiveRecord::Migration
  def change
    add_column :spree_tutorials, :slug, :string
    add_index :spree_tutorials, :slug, unique: true
  end
end
