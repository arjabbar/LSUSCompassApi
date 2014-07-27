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

ActiveRecord::Schema.define(version: 20140727205224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.text     "description"
    t.decimal  "credit_hours"
    t.decimal  "contact_hours"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "book_url"
  end

  create_table "day_of_the_weeks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", force: true do |t|
    t.string   "details_url"
    t.string   "session"
    t.string   "room"
    t.string   "building"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference_number"
    t.integer  "class_size"
    t.integer  "enrolled"
    t.integer  "course_id"
    t.string   "campus"
    t.integer  "seats_left"
    t.integer  "term_id"
  end

  add_index "lectures", ["course_id"], name: "index_lectures_on_course_id", using: :btree
  add_index "lectures", ["term_id"], name: "index_lectures_on_term_id", using: :btree

  create_table "lectures_professors", force: true do |t|
    t.integer  "lecture_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lectures_professors", ["lecture_id"], name: "index_lectures_professors_on_lecture_id", using: :btree
  add_index "lectures_professors", ["professor_id"], name: "index_lectures_professors_on_professor_id", using: :btree

  create_table "professors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_days", force: true do |t|
    t.integer  "schedule_id"
    t.integer  "day_of_the_week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedule_days", ["day_of_the_week_id"], name: "index_schedule_days_on_day_of_the_week_id", using: :btree
  add_index "schedule_days", ["schedule_id"], name: "index_schedule_days_on_schedule_id", using: :btree

  create_table "schedules", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lecture_id"
  end

  add_index "schedules", ["lecture_id"], name: "index_schedules_on_lecture_id", using: :btree

  create_table "terms", force: true do |t|
    t.string   "dom_value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
  end

end
