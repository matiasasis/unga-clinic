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

ActiveRecord::Schema[7.0].define(version: 2022_12_02_012824) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faqs", force: :cascade do |t|
    t.string "title"
    t.string "answer"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_faqs_on_deleted_at"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_professionals_on_deleted_at"
  end

  create_table "terms_and_cons", force: :cascade do |t|
    t.text "text"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_terms_and_cons_on_deleted_at"
  end

  create_table "treatment_types", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_treatment_types_on_deleted_at"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "place"
    t.integer "price"
    t.integer "downpayment"
    t.bigint "professional_id", null: false
    t.integer "duration_min"
    t.bigint "treatment_type_id", null: false
    t.string "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professional_id"], name: "index_treatments_on_professional_id"
    t.index ["treatment_type_id"], name: "index_treatments_on_treatment_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "treatments", "professionals"
  add_foreign_key "treatments", "treatment_types"
end
