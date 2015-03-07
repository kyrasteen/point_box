

ActiveRecord::Schema.define(version: 20150306033152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "points", force: :cascade do |t|
    t.boolean "redeemed?"
    t.integer "user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.text    "name"
    t.integer "cost"
  end

  create_table "user_rewards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
  end

  create_table "users", force: :cascade do |t|
    t.text    "username"
    t.integer "role"
    t.text    "password_digest"
  end

end
