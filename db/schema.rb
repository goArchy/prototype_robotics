# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130126172706) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "featured"
    t.boolean  "published"
    t.integer  "project_id"
    t.string   "image_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remove_image"
    t.string   "slug"
  end

  add_index "articles", ["slug"], :name => "index_spree_articles_on_slug", :unique => true

  create_table "assets", :force => true do |t|
    t.integer  "viewable_id"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_size"
    t.integer  "position"
    t.string   "viewable_type",           :limit => 50
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    :limit => 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.integer  "gallery_id"
  end

  add_index "assets", ["viewable_id"], :name => "index_assets_on_viewable_id"
  add_index "assets", ["viewable_type", "type"], :name => "index_assets_on_viewable_type_and_type"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "gallery_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tutorial_id"
    t.integer  "article_id"
    t.integer  "project_id"
    t.integer  "step_id"
  end

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.string   "image_file_name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured"
    t.boolean  "remove_image"
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "projects", ["slug"], :name => "index_spree_projects_on_slug", :unique => true

  create_table "steps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "tutorial_id"
    t.string   "step_number"
    t.string   "image_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.boolean  "remove_image"
  end

  create_table "tutorials", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "summary"
    t.string   "image_file_name"
    t.boolean  "featured"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remove_image"
    t.string   "category"
    t.string   "slug"
  end

  add_index "tutorials", ["slug"], :name => "index_spree_tutorials_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                      :default => 0, :null => false
    t.integer  "failed_attempts",                    :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.string   "api_key",              :limit => 40
    t.string   "username"
    t.boolean  "active"
  end

  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
