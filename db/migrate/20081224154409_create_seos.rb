class CreateSeos < ActiveRecord::Migration
  def self.up
    create_table :seos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :seos
  end
end
