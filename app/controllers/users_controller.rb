class UsersController < ApplicationController
   layout 'admin'
   layout 'application', :only => [:new, :create, :checkout_address, :edit, :show]
   before_filter :not_logged_in_required, :only => [:new, :create, :checkout_address]
   before_filter :login_required, :only => [:show, :edit, :update]
   before_filter :check_administrator_role, :only => [:index, :destroy, :enable]
 
  #This show action only allows users to view their own profile
  def show
    @user = User.find(params[:id])
    @orders = @user.orders.find(:all, :conditions => ['cart_id != ?', ''])
  end  
  # render new.rhtml
  def new
    @user = User.new
  end
  
  def checkout_address
    @user = User.new
  end
 
  def create
    cookies.delete :auth_token
    @user = User.new(params[:user])
    @user.save!
    #Uncomment to have the user logged in after creating an account - Not Recommended
    self.current_user = @user
    flash[:notice] = "Your Account has been created."
    redirect_to new_order_path 
    rescue ActiveRecord::RecordInvalid
    flash[:error] = "There was a problem creating your account."
    redirect_to checkout_address_path
    end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
    redirect_to new_order_path
    else
    redirect_to edit_user_path(current_user)
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, false)
    flash[:notice] = "User disabled"
    else
    flash[:error] = "There was a problem disabling this user."
    end
    redirect_to :action => 'index'
  end
 
  def enable
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, true)
    flash[:notice] = "User enabled"
    else
    flash[:error] = "There was a problem enabling this user."
    end
    redirect_to :action => 'index'
   end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

end