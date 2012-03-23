class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :name
      t.string :description
      t.string :summary
      t.string :tutorial_image_file_name
      t.boolean :featured
      t.boolean :published

      t.timestamps
    end
  end
end
