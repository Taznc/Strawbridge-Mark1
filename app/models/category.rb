class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  acts_as_list
  
  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
end
