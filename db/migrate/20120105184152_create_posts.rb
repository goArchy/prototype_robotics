class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.boolean :featured
      t.integer :project_id

      t.timestamps
    end
  end
end
