class ChangeAssetsToImages < ActiveRecord::Migration
  def change
    rename_table :assets, :images
  end
end
