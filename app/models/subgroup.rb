class Subgroup < ActiveRecord::Base
  belongs_to :group
  has_and_belongs_to_many :products
  default_scope :order => 'name'

  has_many :subgrouptagorizations
  has_many :metatags, :through => :subgrouptagorizations
  
  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
end
