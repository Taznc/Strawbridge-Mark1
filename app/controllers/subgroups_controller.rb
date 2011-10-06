class SubgroupsController < ApplicationController
  before_filter :load_group
  
  def index
    @subgroups = Subgroup.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subgroups }
    end
  end

  # GET /subgroups/1
  # GET /subgroups/1.xml
  def show
    @subgroup = Subgroup.find(params[:id])
    @product = Product.find(:all, :order => 'price', :conditions =>  ['groups_products.group_id LIKE ?', params[:group_id].to_i], :include => [:groups, :subgroups])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subgroup }
    end
  end
  
  def load_group
    @group = Group.find(params[:group_id], :include => :products )
  end

end