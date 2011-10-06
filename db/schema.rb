# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100115142205) do

  create_table "addresses", :force => true do |t|
    t.integer  "order_id"
    t.string   "address_type"
    t.string   "country"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.text     "extended"
    t.text     "excerpt"
    t.string   "permalink"
    t.string   "keywords"
    t.string   "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles_categories", :id => false, :force => true do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles_metatags", :id => false, :force => true do |t|
    t.integer  "article_id"
    t.integer  "metatag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles_tags", :id => false, :force => true do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles_users", :id => false, :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
    t.datetime "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "worked"
    t.string   "title"
    t.string   "author"
    t.string   "email"
    t.string   "url"
    t.string   "body"
    t.string   "status"
    t.string   "ip"
    t.string   "spam"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "group_products", :id => false, :force => true do |t|
    t.integer  "product_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grouped_products", :force => true do |t|
    t.integer  "product_id"
    t.integer  "grouped_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "permalink"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grouptagorizations", :force => true do |t|
    t.integer  "group_id"
    t.integer  "metatag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "unit_price", :limit => 10, :precision => 10, :scale => 0
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metatags", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metatags_pages", :id => false, :force => true do |t|
    t.integer  "page_id"
    t.integer  "metatag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.integer  "has_shipping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.text     "extended"
    t.text     "excerpt"
    t.string   "permalink"
    t.string   "keywords"
    t.string   "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "cart_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_sizes", :force => true do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price",                 :precision => 10, :scale => 2
    t.text     "description"
    t.integer  "quantity"
    t.integer  "active"
    t.string   "product_code"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.datetime "download_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label_file_name"
    t.string   "label_content_type"
    t.integer  "label_file_size"
    t.datetime "label_updated_at"
    t.string   "company_name"
    t.string   "warning"
    t.string   "rec_use"
  end

  create_table "products_producttags", :force => true do |t|
    t.integer  "product_id"
    t.integer  "producttag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "producttagorizations", :force => true do |t|
    t.integer  "product_id"
    t.integer  "metatag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "producttags", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "related_products", :id => false, :force => true do |t|
    t.integer  "product_id"
    t.integer  "related_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "article_seo"
    t.string   "page_seo"
    t.string   "site_desc"
    t.string   "articles_display"
    t.string   "full_rss"
    t.string   "site_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subgroups", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.integer  "position"
    t.string   "permalink"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subgroups_products", :force => true do |t|
    t.integer  "product_id"
    t.integer  "subgroup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subgrouptagorizations", :force => true do |t|
    t.integer  "subgroup_id"
    t.integer  "metatag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
    t.string   "image"
    t.string   "name"
    t.string   "title"
    t.string   "description"
  end

end
