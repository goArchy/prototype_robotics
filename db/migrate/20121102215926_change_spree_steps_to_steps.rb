class ChangeSpreeStepsToSteps < ActiveRecord::Migration
  def change
    rename_table :spree_steps, :steps
  end
end
