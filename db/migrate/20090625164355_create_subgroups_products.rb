class CreateSubgroupsProducts < ActiveRecord::Migration
  def self.up
    create_table :subgroups_products do |t|
      t.integer :product_id
      t.integer :subgroup_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subgroups_products
  end
end
