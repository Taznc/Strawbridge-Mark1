class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :article_seo
      t.string :page_seo
      t.string :site_desc
      t.string :articles_display
      t.string :full_rss
      t.string :site_name

      t.timestamps
    end
    user = Setting.new
    user.site_name = "CleverStart"
    user.save
  end

  def self.down
    drop_table :settings
  end
end
