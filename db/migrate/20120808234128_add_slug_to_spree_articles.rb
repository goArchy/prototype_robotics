class AddSlugToSpreeArticles < ActiveRecord::Migration
  def change
    add_column :spree_articles, :slug, :string
    add_index :spree_articles, :slug, unique: true
  end
end
