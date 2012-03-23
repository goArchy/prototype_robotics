class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :project_image_file_name
      t.boolean :published

      t.timestamps
    end
  end
end
