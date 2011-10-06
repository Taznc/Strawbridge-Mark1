class Group < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_many :subgroups, :order => 'created_at'
  acts_as_list
  default_scope :order => 'name'

  has_many :grouptagorizations
  has_many :metatags, :through => :grouptagorizations
  
  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def self.search(search)
  if search
    find(:all, :conditions => ["(name) = ?", search], :order => "position")
  else
    find(:all, :order => "position")
  end
end
end
