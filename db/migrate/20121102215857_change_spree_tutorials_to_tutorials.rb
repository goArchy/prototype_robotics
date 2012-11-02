class ChangeSpreeTutorialsToTutorials < ActiveRecord::Migration
  def change
    rename_table :spree_tutorials, :tutorials
  end
end
