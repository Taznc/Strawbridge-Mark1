class CreateGroupedProducts < ActiveRecord::Migration
  def self.up
    create_table :grouped_products do |t|
      t.integer :product_id
      t.integer :grouped_product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :grouped_products
  end
end
