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

ActiveRecord::Schema.define(version: 20171215144048) do

  create_table "applicants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "phone_number"
    t.string "highest_education"
    t.string "english_knowledge"
    t.string "english_class"
    t.string "payment_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_picture_id"
    t.bigint "user_id"
    t.index ["profile_picture_id"], name: "index_applicants_on_profile_picture_id"
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "cvs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cv_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "upload_state"
    t.bigint "applicant_id"
    t.index ["applicant_id"], name: "index_cvs_on_applicant_id"
  end

  create_table "profile_pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "upload_state"
    t.string "image_uid"
    t.bigint "applicant_id"
    t.index ["applicant_id"], name: "index_profile_pictures_on_applicant_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "github_handle"
    t.string "full_name"
    t.string "access_token"
    t.boolean "admin", default: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  add_foreign_key "applicants", "profile_pictures"
  add_foreign_key "applicants", "users"
  add_foreign_key "cvs", "applicants"
  add_foreign_key "profile_pictures", "applicants"
end
