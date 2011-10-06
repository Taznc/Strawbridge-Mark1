class CreateArticleCategories < ActiveRecord::Migration
  def self.up
    create_table :articles_categories, :id => false do |t|
      t.column :article_id, :integer
      t.column :category_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :articles_categories
  end
end
