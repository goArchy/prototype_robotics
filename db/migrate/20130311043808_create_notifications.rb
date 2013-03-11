class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :post_id
      t.string :message
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
