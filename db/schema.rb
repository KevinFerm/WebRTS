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

ActiveRecord::Schema.define(version: 20161106162738) do

  create_table "buildings", force: :cascade do |t|
    t.string   "troop_type", default: "", null: false
    t.integer  "amount",     default: 0,  null: false
    t.integer  "done_at",    default: 0,  null: false
    t.integer  "town_id",                 null: false
    t.integer  "user_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "unit",       default: 0,  null: false
  end

  create_table "maps", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movements", force: :cascade do |t|
    t.boolean  "move_type",  default: false, null: false
    t.integer  "bowmen",     default: 0,     null: false
    t.integer  "swordsmen",  default: 0,     null: false
    t.integer  "from_town",  default: 0,     null: false
    t.integer  "to_town",    default: 0,     null: false
    t.integer  "from",                       null: false
    t.integer  "to",                         null: false
    t.integer  "done_at",    default: 0,     null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "units",      default: "{}",  null: false
  end

  create_table "towns", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.integer  "level"
    t.string   "population", default: "{}"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.integer  "swordsmen",  default: 0,      null: false
    t.integer  "bowmen",     default: 0,      null: false
    t.string   "title",      default: "Town", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name",       default: "",  null: false
    t.integer  "health",     default: 0,   null: false
    t.integer  "armor",      default: 0,   null: false
    t.integer  "max_hit",    default: 0,   null: false
    t.integer  "min_hit",    default: 0,   null: false
    t.integer  "attack",     default: 0,   null: false
    t.integer  "speed",      default: 0,   null: false
    t.integer  "defense",    default: 0,   null: false
    t.string   "range",      default: "0", null: false
    t.string   "effects",    default: "0", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "cost",       default: 10,  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.integer  "permissions",            default: 0,     null: false
    t.integer  "points"
    t.string   "rank"
    t.integer  "coins",                  default: 10000, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

end
