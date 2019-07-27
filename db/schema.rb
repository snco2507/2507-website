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

ActiveRecord::Schema.define(version: 20170917094336) do

  create_table "activities", force: :cascade do |t|
    t.string   "title",                         null: false
    t.string   "location"
    t.string   "category"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.date     "activity_date",                 null: false
    t.string   "details",                       null: false
    t.date     "respond_by",                    null: false
    t.boolean  "archived",      default: false, null: false
    t.date     "end_date"
    t.string   "level"
  end

  create_table "attendances", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "activity_id"
    t.string   "level"
  end

  create_table "users", force: :cascade do |t|
    t.string "username",                          null: false
    t.string "crypted_password",                  null: false
    t.string "salt",                              null: false
    t.string "user_type"
    t.string "default_view",     default: "bars"
  end

end
