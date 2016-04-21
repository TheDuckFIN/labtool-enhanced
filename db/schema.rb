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

ActiveRecord::Schema.define(version: 20160421125954) do

  create_table "checklist_options", force: :cascade do |t|
    t.integer  "checklist_id"
    t.string   "description"
    t.decimal  "points"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "checklists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "codereview_groups", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "irc_channel"
    t.boolean  "registeration_open"
    t.integer  "leader_id"
    t.integer  "current_week_id"
    t.integer  "default_codereview_group_id"
  end

  add_index "courses", ["leader_id"], name: "index_courses_on_leader_id"

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "teacher"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "active"
    t.string   "topic"
    t.string   "repository"
    t.integer  "codereview_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "realname"
    t.string   "email"
    t.string   "irc_nick"
    t.string   "student_number"
  end

  create_table "weekly_submissions", force: :cascade do |t|
    t.integer  "participation_id"
    t.integer  "week_id"
    t.decimal  "points"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "weeks", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "number"
    t.integer  "max_points"
    t.boolean  "code_review"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "checklist_id"
  end

end
