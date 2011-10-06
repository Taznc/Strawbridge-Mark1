class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.decimal :price, :precision=>10, :scale=>2
      t.text :description
      t.integer :quantity
      t.integer :active
      t.string :product_code
      
      t.string :download_file_name
      t.string :download_content_type
      t.integer :download_file_size
      t.datetime :download_updated_at
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
