class ChangeSpreeGalleriesToGalleries < ActiveRecord::Migration
  def change
    rename_table :spree_galleries, :galleries
  end
end
