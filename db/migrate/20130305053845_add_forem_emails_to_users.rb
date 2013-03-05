class AddForemEmailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forem_emails, :boolean, :default => true
  end
end
