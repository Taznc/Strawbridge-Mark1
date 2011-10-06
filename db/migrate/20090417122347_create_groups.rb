class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :position
      t.string :permalink
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
