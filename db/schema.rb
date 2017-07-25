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

ActiveRecord::Schema.define(version: 20170719174518) do

  create_table "care_sub_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "care_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "fullname",         null: false
    t.string   "email",            null: false
    t.integer  "care_type_id",     null: false
    t.integer  "care_sub_type_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["care_sub_type_id"], name: "fk_rails_def339cfec", using: :btree
    t.index ["care_type_id"], name: "fk_rails_d87e503bc0", using: :btree
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",             null: false
    t.integer  "category_id",      null: false
    t.integer  "care_type_id",     null: false
    t.integer  "care_sub_type_id", null: false
    t.string   "address",          null: false
    t.string   "city",             null: false
    t.string   "state",            null: false
    t.string   "zip",              null: false
    t.integer  "price_rating",     null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["care_sub_type_id"], name: "fk_rails_f6858f23c1", using: :btree
    t.index ["care_type_id"], name: "fk_rails_296b0cc8aa", using: :btree
    t.index ["category_id"], name: "fk_rails_46b3b81b9d", using: :btree
  end

  create_table "wellists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                      null: false
    t.integer  "vendor_id",                    null: false
    t.boolean  "public_list",   default: true
    t.boolean  "public_vendor", default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["user_id"], name: "fk_rails_13244e6239", using: :btree
    t.index ["vendor_id"], name: "fk_rails_15c9c576f3", using: :btree
  end

  add_foreign_key "users", "care_sub_types", on_delete: :cascade
  add_foreign_key "users", "care_types", on_delete: :cascade
  add_foreign_key "vendors", "care_sub_types", on_delete: :cascade
  add_foreign_key "vendors", "care_types", on_delete: :cascade
  add_foreign_key "vendors", "categories", on_delete: :cascade
  add_foreign_key "wellists", "users", on_delete: :cascade
  add_foreign_key "wellists", "vendors", on_delete: :cascade
end
