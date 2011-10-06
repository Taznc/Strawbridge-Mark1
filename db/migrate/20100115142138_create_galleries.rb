class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
