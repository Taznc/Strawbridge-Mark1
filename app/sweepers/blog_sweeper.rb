class BlogSweeper < ActionController::Caching::Sweeper
  observe Page # This sweeper is going to keep an eye on the page model

  # If our sweeper detects that a page was created call this
  def after_create(page)
          expire_cache_for(page)
  end
  
  # If our sweeper detects that a page was updated call this
  def after_update(page)
          expire_cache_for(page)
  end
  
  # If our sweeper detects that a page was deleted call this
  def after_destroy(page)
          expire_cache_for(page)
  end
  
  def after_save(page)
     expire_cache_for(page)
   end
          
  private
  def expire_cache_for(record)
    # Expire the list page now that we pageed a new blog entry
    #expire_page(:controller => 'page', :action => 'list')
    expire_page :controller => '/pages', :action => 'show', :id => record.id
    
    # Also expire the show page, incase we just edited a blog entry
    #expire_page(:controller => 'page', :action => 'show', :id => record.id)
  end
end