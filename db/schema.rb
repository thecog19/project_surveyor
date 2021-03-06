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

ActiveRecord::Schema.define(version: 20161206222705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "possible_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "question_responses", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "survey_response_id"
  end

  create_table "question_responses_answers", force: :cascade do |t|
    t.integer  "question_response_id"
    t.integer  "possible_answer_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["possible_answer_id"], name: "index_question_responses_answers_on_possible_answer_id", using: :btree
    t.index ["question_response_id"], name: "index_question_responses_answers_on_question_response_id", using: :btree
  end

  create_table "question_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["description"], name: "index_question_types_on_description", unique: true, using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_type_id"
    t.integer  "survey_id"
    t.string   "body"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "max_answers",      default: 1
    t.integer  "required"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "question_responses_answers", "possible_answers"
  add_foreign_key "question_responses_answers", "question_responses"
end
