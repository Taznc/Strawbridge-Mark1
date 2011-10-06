class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :body
      t.text :extended
      t.text :excerpt
      t.string :permalink
      t.string :keywords
      t.string :online

      t.timestamps
    end
    article = Article.new
    article.title = "Welcome to Mk1!"
    article.excerpt = "Article Excerpt"
    article.body = "Article Body"
    article.extended = "Article Extended"
    article.permalink = "welcome to Mk1"
    article.save(false)
  end

  def self.down
    drop_table :articles
  end
end
