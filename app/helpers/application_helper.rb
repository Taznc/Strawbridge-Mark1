# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def this_blog
    @settings ||= Setting.find(:first)
  end
  
  def these_categories
    @categories ||= Category.all(:order => 'position', :include => :articles)
  end
  
  def list_tags
    @tags ||= Tag.find(:all, :include => :articles)
  end
  
  def owner_desc
    @user ||= User.find(:first)
  end
  
  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    @current_cart
  end
    
end
