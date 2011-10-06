class CreateSubgrouptagorizations < ActiveRecord::Migration
  def self.up
    create_table :subgrouptagorizations do |t|
      t.integer :subgroup_id
      t.integer :metatag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subgrouptagorizations
  end
end
