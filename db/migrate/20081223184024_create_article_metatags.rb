class CreateArticleMetatags < ActiveRecord::Migration
  def self.up
    create_table :articles_metatags, :id => false do |t|
      t.column :article_id, :integer
      t.column :metatag_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :articles_metatags
  end
end
