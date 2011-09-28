class HoboMigration5 < ActiveRecord::Migration
  def self.up
    drop_table :category_translations
    drop_table :site_translations
  end

  def self.down
    create_table "category_translations", :force => true do |t|
      t.integer  "category_id"
      t.string   "locale"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"

    create_table "site_translations", :force => true do |t|
      t.integer  "site_id"
      t.string   "locale"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "site_translations", ["site_id"], :name => "index_site_translations_on_site_id"
  end
end
