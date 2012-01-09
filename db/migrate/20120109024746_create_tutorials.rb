class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :name
      t.string :description
      t.string :summary

      t.timestamps
    end
  end
end
