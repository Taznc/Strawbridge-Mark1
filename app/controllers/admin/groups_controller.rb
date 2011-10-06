class Admin::GroupsController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
  
  def index
    @groups = Group.all(:order => "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])
      if @group.save
         render :partial => 'group', :object => @group
      end
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(admin_groups_url) }
      format.xml  { head :ok }
    end
  end
  
  def sort
  params[:group].each_with_index do |id, index|
    Group.update_all(['position=?', index+1], ['id=?', id])
  end
  render :nothing => true
  end

end
