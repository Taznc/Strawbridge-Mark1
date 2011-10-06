class CartsController < ApplicationController

  def show
    @cart = current_cart
  end
  
  def empty_cart
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to products_path
    flash[:notice] = 'Cart is now Empty.'
  end
  
  def update
    @cart = current_cart
    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to :back }
        format.xml  { head :ok }
      end
    end
  end
end
