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

ActiveRecord::Schema.define(version: 20140314212234) do

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "manager"
    t.string   "organization"
    t.boolean  "is_active"
    t.boolean  "is_promoted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_reports", force: true do |t|
    t.text     "summary"
    t.string   "overall"
    t.string   "scope"
    t.string   "schedule"
    t.string   "resources"
    t.datetime "reported_at"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "status_reports", ["project_id"], name: "index_status_reports_on_project_id", using: :btree

end
