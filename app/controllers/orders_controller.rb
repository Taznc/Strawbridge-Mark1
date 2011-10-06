class OrdersController < ApplicationController
  #ssl_required :new, :create
  require 'active_shipping'
  include ActiveMerchant::Shipping
  

  def new
    @order = Order.new
    @cart = current_cart
    @address = current_user.address
    total_weight = @cart.line_items.inject(0){|sum,item| sum + (item.weight*item.quantity)}

    if current_user.zipcode != "00000"
    if current_user.same_address == 0
      packages = [
      Package.new(  (total_weight * 16),           # 7.5 lbs, times 16 oz/lb.
                [15, 10, 4.5],              # 15x10x4.5 inches
                :units => :imperial)        # not grams, not centimetres
                      ]
      origin = Location.new(    :country => 'US',
                                :state => 'NC',
                                :city => 'Morehead City',
                                :zip => '28557')
      destination = Location.new( :country => 'US',
                                :state => @address.state,
                                :city => @address.city,
                                :zip => @address.zipcode)
      
      ups = UPS.new(:login => 'jrissler', :password => 'jrissler', :key => 'FC47FD3C877D8F2A')
      response = ups.find_rates(origin, destination, packages)
      @ups_rates = response.rates.sort_by(&:price).collect {|rate| [rate.service_name + " " + "$" + (sprintf('%.2f', (rate.price.to_f / 100))) ]}
    else
      packages = [
      Package.new(  (total_weight * 16),           # 7.5 lbs, times 16 oz/lb.
                  [15, 10, 4.5],              # 15x10x4.5 inches
                  :units => :imperial)        # not grams, not centimetres
                        ]
      origin = Location.new(      :country => 'US',
                                  :state => 'NC',
                                  :city => 'Morehead City',
                                  :zip => '28557')
      destination = Location.new( :country => 'US',
                                  :state => current_user.state,
                                  :city => current_user.city,
                                  :zip => current_user.zipcode)
      ups = UPS.new(:login => 'jrissler', :password => 'jrissler', :key => 'FC47FD3C877D8F2A')
      response = ups.find_rates(origin, destination, packages)
      @ups_rates = response.rates.sort_by(&:price).collect {|rate| [rate.service_name + " " + "$" + (sprintf('%.2f', (rate.price.to_f / 100))) ]}
    end
    end
    @cart.set_sales_tax(current_user)
  end

  def create
    @order = current_cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    @order.user_id = current_user.id
    @cart = current_cart
    @order.tax = @cart.set_sales_tax(current_user)
    if @order.save
      @order.cart.set_sales_tax(current_user)
      if @order.purchase
        reset_session
        @ordercom = @order
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
  
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end
  
  def address_not_found
    redirect_to edit_user_path(current_user)
      flash[:notice] = "Your Address does not appear to be valid. Please check your address below."
  end
  
  

end
