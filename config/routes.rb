ActionController::Routing::Routes.draw do |map|
  map.resources :producttags
  map.resources :events
  map.resources :orders
  map.resources :groups, :has_many => :subgroups
  map.resources :carts
  map.resources :payment_notifications
  map.resources :line_items
  map.resources :products, :has_many => [:comments, :producttags]

  map.current_cart 'cart', :controller => 'carts', :action => 'show', :id => 'current'
  map.remove_from_cart 'removecart', :controller => 'line_items', :action => 'remove_from_cart', :id => 'current'
  map.update_cart 'updatecart', :controller => 'line_items', :action => 'update_cart', :id => 'current'
  map.add_shipping 'add_shipping', :controller => 'carts', :action => 'add_shipping'
  map.checkout_address 'checkout_address', :controller => 'users', :action => 'checkout_address'
  
  map.search_site 'search_site', :controller => 'pages', :action => 'search'
  
  map.resources :settings

  map.resources :articles, :has_many => :comments
  
  map.resources :comments
  
  map.resources :metatags

  map.resources :tags

  map.resources :categories

  map.resources :pages

  map.namespace :admin do |admin|
    admin.resources :metatags, :collection => { :sort => :post }
    admin.resources :seos
    admin.resources :galleries
    admin.resources :tags, :collection => { :sort => :post }
    admin.resources :categories, :collection => { :sort => :post }
    admin.resources :groups, :collection => { :sort => :post }
    admin.resources :subgroups, :collection => { :sort => :post }
    admin.resources :pages,:member=>{:copy=>:get} do |page|
      page.resources :galleries
    end
    admin.resources :articles
    admin.resources :settings
    admin.resources :comments, :collection => { :deleteall => :put }, :member => { :approve => :put, :reject => :put}
    admin.resources :events
    admin.resources :products,:member=>{:copy=>:get}, :collection => { :sort => :post }
    admin.sortproducts '/sortproducts', :controller => 'products', :action => 'sortproducts'
    admin.resources :producttags
    admin.resources :orders,:collection=>{:export=>:get}
    admin.dashboard '/dashboard', :controller => 'seos', :action => 'dashboard'
    admin.approved '/approved', :controller => 'comments', :action => 'viewapproved'
    
    # static pages
    admin.pageviews '/pageviews', :controller => 'seos', :action => 'pageviews'
    admin.trafficsources '/trafficsources', :controller => 'seos', :action => 'trafficsources'
  end
    map.root :controller => 'pages', :action => 'show', :id => '1'

    #login, signup, etc
    map.homepage '/homepage', :controller => 'deals', :action => 'homepage'
    map.advancedsearch '/advancedsearch', :controller => 'deals', :action => 'advancedsearch'
    map.signup '/signup', :controller => 'users', :action => 'new'
    map.login '/login', :controller => 'sessions', :action => 'new'
    map.logout '/logout', :controller => 'sessions', :action => 'destroy'
    map.activate '/activate/:id', :controller => 'accounts', :action => 'show'
    map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
    map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
    map.change_password '/change_password', :controller => 'accounts', :action => 'edit'
    
    
    # See how all your routes lay out with "rake routes"
    
    map.resources :users, :member => { :enable => :put } do |users|
      users.resource :account
      users.resources :roles
    end
   
    map.resource :session
    map.resource :password


    # Install the default routes as the lowest priority.
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'

end