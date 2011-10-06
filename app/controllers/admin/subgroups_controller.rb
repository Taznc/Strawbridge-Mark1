class Admin::SubgroupsController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
  
  def index
    @subgroups = Subgroup.find(:all, :include => :group, :order => "group_id")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subgroups }
    end
  end

  def show
    @subgroup = Subgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subgroup }
    end
  end

  def new
    @subgroup = Subgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subgroup }
    end
  end

  def edit
    @subgroup = Subgroup.find(params[:id])
  end

  def create
    @subgroup = Subgroup.new(params[:subgroup])

    respond_to do |format|
      if @subgroup.save
        flash[:notice] = 'Subgroup was successfully created.'
        format.html { redirect_to :action => 'index' }
        format.xml  { render :xml => @subgroup, :status => :created, :location => @subgroup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @subgroup = Subgroup.find(params[:id])

    respond_to do |format|
      if @subgroup.update_attributes(params[:subgroup])
        flash[:notice] = 'Subgroup was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @subgroup = Subgroup.find(params[:id])
    @subgroup.destroy

    respond_to do |format|
      format.html { redirect_to(subgroups_url) }
      format.xml  { head :ok }
    end
  end

end
