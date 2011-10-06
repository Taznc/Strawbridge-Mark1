class CreateGrouptagorizations < ActiveRecord::Migration
  def self.up
    create_table :grouptagorizations do |t|
      t.integer :group_id
      t.integer :metatag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :grouptagorizations
  end
end
