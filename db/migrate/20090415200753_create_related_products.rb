class CreateRelatedProducts < ActiveRecord::Migration
  def self.up
    create_table :related_products, :force => true, :id => false do |t|
      t.integer :product_id
      t.integer :related_product_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :related_products
  end
end
