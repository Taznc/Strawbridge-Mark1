class CreatePagesMetatags < ActiveRecord::Migration
  def self.up
    create_table :metatags_pages, :id => false do |t|
      t.integer :page_id
      t.integer :metatag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages_metatags
  end
end
