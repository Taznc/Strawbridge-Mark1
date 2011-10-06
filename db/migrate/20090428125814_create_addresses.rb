class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :order_id
      t.string :address_type
      t.string :country
      t.string :address_1
      t.string :address_2
      t.string :zipcode
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
