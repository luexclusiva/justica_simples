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

ActiveRecord::Schema.define(version: 20_201_210_235_823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "judicial_steps", force: :cascade do |t|
    t.bigint "step_id", null: false
    t.bigint "judicial_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.index ["judicial_id"], name: "index_judicial_steps_on_judicial_id"
    t.index ["step_id"], name: "index_judicial_steps_on_step_id"
  end

  create_table "judicials", force: :cascade do |t|
    t.string "number"
    t.integer "judicial_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "judicial_id", null: false
    t.string "role"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["judicial_id"], name: "index_parties_on_judicial_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "cnj_number"
    t.string "integer"
    t.string "description"
    t.string "translation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_judicials", force: :cascade do |t|
    t.bigint "judicial_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["judicial_id"], name: "index_user_judicials_on_judicial_id"
    t.index ["user_id"], name: "index_user_judicials_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "judicial_steps", "judicials"
  add_foreign_key "judicial_steps", "steps"
  add_foreign_key "parties", "judicials"
  add_foreign_key "user_judicials", "judicials"
  add_foreign_key "user_judicials", "users"
end
