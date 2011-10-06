class Page < ActiveRecord::Base
  has_and_belongs_to_many :metatags
  has_many :galleries
  
  def to_param
    "#{id}-#{permalink.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end

  def self.search(page, searchpast)
    if searchpast
      paginate(:all, :per_page => 4, :page => page, :conditions => ['body LIKE ? OR title LIKE ?', "%#{searchpast}%", "%#{searchpast}%"])
    else
      paginate(:all, :per_page => 8, :page => page, :order => "pages.created_at DESC")
    end
  end
  
  def self.searchpages(page, searchterm)
      paginate(:all, :per_page => 30, :page => page, :order => "title ASC", :conditions => ['title LIKE ? OR body LIKE ? OR excerpt LIKE ?', "%#{searchterm}%","%#{searchterm}%","%#{searchterm}%"])
  end
  
end
