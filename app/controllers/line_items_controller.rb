class LineItemsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
    @cart = current_cart
    current_item = @cart.line_items.find_by_product_id(@product.id)
    if current_item
      if params[:quantity].to_s == ""
        current_item.quantity += 1
      else
        current_item.quantity += params[:quantity].to_i
      end
      current_item.save
    else
      if params[:quantity].to_s == ""
           @line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price, :weight => params[:weight])   
        else
           @line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => params[:quantity], :unit_price => @product.price, :weight => params[:weight])   
      end
    end
    flash[:notice] = "1 #{@product.name} added to cart."
    redirect_to :back
  end
  
  def remove_from_cart
    @product = Product.find(params[:product_id])
    @cart = current_cart
    current_item = @cart.line_items.find_by_product_id(@product.id)
    current_item.destroy
    #if current_item.quantity > 1
    #current_item.quantity -= 1
    #current_item.save
    #else
    #current_item.destroy
    
    flash[:notice] = "Removed #{@product.name} from cart."
    redirect_to current_cart_url
  end
  
  def update
    @line_item = LineItem.find(params[:id])
    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        flash[:notice] = 'Quantity was successfully updated.'
        format.html { redirect_to current_cart_url }
        format.xml  { head :ok }
      end
    end
  end
  
end
