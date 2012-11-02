class ChangeSpreeArticlesToArticles < ActiveRecord::Migration
  def change
    rename_table :spree_articles, :articles
  end
end
