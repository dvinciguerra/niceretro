# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2015_11_18_201534) do
  create_table "demands", force: :cascade do |t|
    t.text "description"
    t.integer "retrospective_id"
    t.string "user"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["retrospective_id"], name: "index_demands_on_retrospective_id"
  end

  create_table "doubts", force: :cascade do |t|
    t.text "description"
    t.integer "retrospective_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["retrospective_id"], name: "index_doubts_on_retrospective_id"
  end

  create_table "retrospectives", force: :cascade do |t|
    t.string "title"
    t.datetime "date"
    t.integer "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.text "description"
    t.string "type"
    t.integer "retrospective_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["retrospective_id"], name: "index_topics_on_retrospective_id"
  end
end
