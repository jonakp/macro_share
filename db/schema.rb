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

ActiveRecord::Schema.define(version: 2018_09_25_140408) do

  create_table "userfeatures", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gender"
    t.integer "height"
    t.integer "weight"
    t.integer "age"
    t.integer "activity"
    t.integer "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_calorie"
    t.integer "protein"
    t.integer "fat"
    t.integer "carbo"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
