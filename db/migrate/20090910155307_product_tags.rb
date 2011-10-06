class ProductTags < ActiveRecord::Migration
  def self.up
    create_table :products_producttags do |t|
      t.integer :product_id
      t.integer :producttag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products_producttags
  end
end
