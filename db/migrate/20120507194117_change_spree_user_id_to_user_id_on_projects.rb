class ChangeSpreeUserIdToUserIdOnProjects < ActiveRecord::Migration
  def change
    rename_column :spree_projects, :spree_user_id, :user_id
  end
end
