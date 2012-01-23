class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :image_file_name
      t.boolean :published

      t.timestamps
    end
  end
end
