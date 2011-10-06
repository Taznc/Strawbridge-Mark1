class PageSweeper < ActionController::Caching::Sweeper
  observe Page

  def after_save(page)
    expire_cache(page)
   end
  
  def after_destroy(page)
    expire_cache(page)
   end
  
  def expire_cache(page)
    expire_page :controller => '/pages', :action => 'show', :id => "#{page.id}-#{page.permalink.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
   end
end