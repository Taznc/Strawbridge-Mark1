class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
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
    page = Page.new
    page.title = "Welcome to Mk1!"
    page.body ="Page Body"
    page.permalink ="home"
    page.save(false)
  end

  def self.down
    drop_table :pages
  end
end
