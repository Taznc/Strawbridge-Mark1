class CreateProducttags < ActiveRecord::Migration
  def self.up
    create_table :producttags do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :producttags
  end
end
