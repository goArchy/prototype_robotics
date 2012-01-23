class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.boolean :featured
      t.boolean :published
      t.integer :project_id
      t.string :image_file_name

      t.timestamps
    end
  end
end
