class CreateProducttagorizations < ActiveRecord::Migration
  def self.up
    create_table :producttagorizations do |t|
      t.integer :product_id
      t.integer :metatag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :producttagorizations
  end
end
