class ProductsController < ApplicationController

  def index
    @products = Product.searchadmin(*params.values_at(:page, :searchname, :searchproductcode, :searchcompanyname))
    @group = Group.all
    @producttag = Producttag.find(:all, :order => "name ASC")
    @product_groups = @group.group_by { |t| t.name }
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def show
    @product = Product.find(params[:id])
    @groups = Group.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

end
