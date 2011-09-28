class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :machines do |t|
      t.string   :name
      t.text     :description
      t.integer  :height
      t.integer  :width
      t.integer  :depth
      t.integer  :weight
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :category_id
    end
		Machine.create_translation_table! :name => :string, :description => :text
    add_index :machines, [:category_id]

    create_table :sites do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
		Site.create_translation_table! :name => :string

    create_table :categories do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :site_id
    end
		Category.create_translation_table! :name => :string
    add_index :categories, [:site_id]
  end

  def self.down
    drop_table :machines
    drop_table :sites
    drop_table :categories
		Machine.drop_translation_table!
		Site.drop_translation_table!
		Category.drop_translation_table!
  end
end
