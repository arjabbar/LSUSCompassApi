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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140629212650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "description"
    t.decimal  "credit_hours"
    t.decimal  "contact_hours"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_of_the_weeks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "details_url"
    t.string   "session"
    t.string   "room"
    t.string   "building"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference_number"
    t.integer  "class_size"
    t.integer  "enrolled"
    t.integer  "professor_id"
    t.integer  "course_id"
    t.integer  "days_of_the_week_id"
  end

  add_index "lectures", ["course_id"], name: "index_lectures_on_course_id", using: :btree
  add_index "lectures", ["days_of_the_week_id"], name: "index_lectures_on_days_of_the_week_id", using: :btree
  add_index "lectures", ["professor_id"], name: "index_lectures_on_professor_id", using: :btree

  create_table "terms", force: true do |t|
    t.string   "dom_value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
