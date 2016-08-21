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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160821213019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_links", force: :cascade do |t|
    t.integer  "email_id"
    t.integer  "link_id"
    t.string   "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.index ["email_id"], name: "index_email_links_on_email_id", using: :btree
    t.index ["link_id"], name: "index_email_links_on_link_id", using: :btree
  end

  create_table "emails", force: :cascade do |t|
    t.string   "from_name"
    t.string   "from_email"
    t.string   "subject"
    t.text     "html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "description"
    t.boolean  "hn_status"
  end

  add_foreign_key "email_links", "emails"
  add_foreign_key "email_links", "links"
end
