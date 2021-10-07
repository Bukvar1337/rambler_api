# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_06_130644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rubrics", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_rubrics_on_title", unique: true
  end

  create_table "tag_topics", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_tag_topics_on_tag_id"
    t.index ["topic_id"], name: "index_tag_topics_on_topic_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_tags_on_title", unique: true
  end

  create_table "topics", force: :cascade do |t|
    t.string "heading", null: false
    t.string "announcement"
    t.text "cover"
    t.text "urn", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "body"
    t.bigint "rubric_id"
    t.index ["rubric_id"], name: "index_topics_on_rubric_id"
    t.index ["urn"], name: "index_topics_on_urn", unique: true
  end

  add_foreign_key "tag_topics", "tags"
  add_foreign_key "tag_topics", "topics"
  add_foreign_key "topics", "rubrics"
end
