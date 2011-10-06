class CreateGroupProducts < ActiveRecord::Migration
  def self.up
    create_table :group_products, :id => false do |t|
      t.integer :product_id
      t.integer :group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :group_products
  end
end
