class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.column :worked, :integer
      t.string :title
      t.string :author
      t.string :email
      t.string :url
      t.string :body
      t.string :status
      t.string :ip
      t.string :spam

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
