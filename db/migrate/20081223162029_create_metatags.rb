class CreateMetatags < ActiveRecord::Migration
  def self.up
    create_table :metatags do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :metatags
  end
end
