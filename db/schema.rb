# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101117190902) do

  create_table "data_files", :force => true do |t|
    t.string   "title"
    t.integer  "record_count"
    t.text     "schema"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dataset_id"
  end

  create_table "datasets", :force => true do |t|
    t.string   "company_name"
    t.string   "email"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
  end

  add_index "datasets", ["uuid"], :name => "index_datasets_on_uuid"

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.text     "doc"
    t.integer  "data_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_type"
    t.integer  "column"
    t.boolean  "index"
  end

  add_index "fields", ["data_file_id"], :name => "index_fields_on_data_file_id"

end
