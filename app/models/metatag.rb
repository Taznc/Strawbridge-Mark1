class Metatag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  acts_as_list

  has_many :grouptagorizations
  has_many :groups, :through => :grouptagorization

  has_many :subgrouptagorizations
  has_many :subgroups, :through => :subgrouptagorization

  has_many :producttagorizations
  has_many :products, :through => :producttagorizations
  
  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
end
