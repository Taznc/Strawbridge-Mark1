class Admin::OrdersController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
  
  def index
    @orders = Order.find(:all, :conditions => ['cart_id != ?', ''])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @metatags }
    end
  end
  
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end
  
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  def create
    @order = current_cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      flash[:notice] = 'Order was successfully deleted.'
      format.html { redirect_to(admin_orders_url) }
      format.xml  { head :ok }
    end
  end

  def export
    @orders = Order.find(:all, :conditions => ['cart_id != ?', ''], :include=>:user)
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="report.xls"'
    headers['Cache-Control'] = ''
    render :layout => false
  end

end
