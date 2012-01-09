class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.text :description
      t.integer :tutorial_id

      t.timestamps
    end
  end
end
