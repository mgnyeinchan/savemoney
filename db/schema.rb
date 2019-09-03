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

ActiveRecord::Schema.define(version: 20190903154149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advances", force: :cascade do |t|
    t.string "description", limit: 1000
    t.integer "amountdeposit"
    t.integer "currentamount"
    t.integer "user_id"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dailyexp_fadvs", force: :cascade do |t|
    t.string "description", limit: 1000
    t.integer "amount"
    t.integer "advance_id"
    t.integer "user_id"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dailyexpfadvs", force: :cascade do |t|
    t.string "description", limit: 1000
    t.integer "amount"
    t.integer "advance_id"
    t.integer "user_id"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dailyexps", force: :cascade do |t|
    t.string "description", limit: 1000
    t.integer "amount"
    t.integer "user_id"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "familysharings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shareto1"
    t.integer "shareto2"
    t.integer "shareto3"
    t.integer "shareto4"
    t.integer "shareto5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monthlyaudits", force: :cascade do |t|
    t.integer "totaldepositamt"
    t.integer "totalbalamt"
    t.integer "totalexpamt"
    t.integer "totalotherexp"
    t.integer "user_id"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "savemoneys", force: :cascade do |t|
    t.string "description", limit: 1000
    t.integer "amount"
    t.integer "showto1"
    t.integer "showto2"
    t.integer "showto3"
    t.integer "user_id"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "showby1"
    t.integer "showby2"
    t.integer "showby3"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role"
    t.string "status"
  end

  create_table "withdraws", force: :cascade do |t|
    t.string "description", limit: 1000
    t.integer "amount"
    t.integer "user_id"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
