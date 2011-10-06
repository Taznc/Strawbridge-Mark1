class CreateSubgroups < ActiveRecord::Migration
  def self.up
    create_table :subgroups do |t|
      t.integer :group_id
      t.string :name
      t.integer :position
      t.string :permalink
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :subgroups
  end
end
