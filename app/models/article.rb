class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :metatags
  has_and_belongs_to_many :categories, :order => "position"

  has_and_belongs_to_many :users
  
  has_many :comments, :as => :commentable
  
  named_scope :ordered, lambda {|*args| {:order => (args.first || 'created_at DESC')} }
  
  def to_param
    "#{id}-#{permalink.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def self.search(search)
  if search
    find(:all, :conditions => ["MONTH(created_at) = ?", search])
  else
    find(:all)
  end
end

end