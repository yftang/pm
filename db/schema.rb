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

ActiveRecord::Schema.define(version: 20140103072833) do

  create_table "projects", force: true do |t|
    t.string   "acc"
    t.date     "start_date"
    t.date     "dead_line"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assigner"
    t.string   "species"
    t.string   "status"
    t.string   "status_samples_received"
    t.string   "status_experiments_done"
    t.string   "status_bioinformatics_done"
    t.string   "status_report_finished"
    t.string   "delivery_signed_by"
    t.string   "delivery_express_number"
    t.date     "delivery_received_date"
    t.string   "experiment_operator"
    t.date     "experiment_complete_date"
    t.string   "bioinformatics_operator"
    t.date     "bioinformatics_complete_date"
    t.string   "report_holder"
  end

  add_index "projects", ["acc"], name: "index_projects_on_acc"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "workships", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workships", ["project_id"], name: "index_workships_on_project_id"
  add_index "workships", ["user_id", "project_id"], name: "index_workships_on_user_id_and_project_id", unique: true
  add_index "workships", ["user_id"], name: "index_workships_on_user_id"

end
