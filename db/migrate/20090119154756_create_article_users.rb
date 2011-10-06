class CreateArticleUsers < ActiveRecord::Migration
  def self.up
    create_table :articles_users, :id => false do |t|
      t.column :article_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :articles_users
  end
end
