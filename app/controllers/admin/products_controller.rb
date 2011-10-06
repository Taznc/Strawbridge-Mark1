class Admin::ProductsController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
  
  def index
    @products = Product.searchadmin(*params.values_at(:page, :searchname, :searchproductcode, :searchcompanyname))
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def sortproducts
    @products = Product.all(:order => "position")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to :action => 'index' }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(admin_products_url) }
      format.xml  { head :ok }
    end
  end

  def copy
    @product = Product.find(params[:id])
    @new_item = @product.clone
    @new_item.image = @product.image
    @new_item.label = @product.label
    @new_item.image_file_name  = @product.image_file_name
    @new_item.label_file_name  = @product.label_file_name
    respond_to do |format|
      if @new_item.save
        flash[:notice] = 'Product Succesfully Copied.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        flash[:notice] = 'Error.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      end
    end
  end

  def sort
  params[:product].each_with_index do |id, index|
    Product.update_all(['position=?', index+1], ['id=?', id])
  end
  render :nothing => true
  end
  
end
