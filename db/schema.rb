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

ActiveRecord::Schema[7.2].define(version: 2025_06_03_145013) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.string "name"
    t.string "rg"
    t.integer "age"
    t.string "guest_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_guests_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.string "rg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "party_id", null: false
    t.index ["party_id"], name: "index_participants_on_party_id"
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "scheduled_at"
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "state"
    t.string "birthday_person_name"
    t.integer "birthday_person_age"
    t.integer "status"
    t.string "timestamps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "state"
    t.string "city"
    t.integer "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "guests", "participants"
  add_foreign_key "participants", "parties"
  add_foreign_key "parties", "users"
end
