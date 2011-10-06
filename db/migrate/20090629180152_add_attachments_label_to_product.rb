class AddAttachmentsLabelToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :label_file_name, :string
    add_column :products, :label_content_type, :string
    add_column :products, :label_file_size, :integer
    add_column :products, :label_updated_at, :datetime
    
    add_column :products, :company_name, :string
    add_column :products, :warning, :string
    add_column :products, :rec_use, :string
  end

  def self.down
    remove_column :products, :label_file_name
    remove_column :products, :label_content_type
    remove_column :products, :label_file_size
    remove_column :products, :label_updated_at
    
    remove_column :products, :company_name
    remove_column :products, :warning
    remove_column :products, :rec_use
  end
end
