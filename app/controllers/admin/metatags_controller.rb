class Admin::MetatagsController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
  
  # GET /metatags
  # GET /metatags.xml
  def index
    @metatags = Metatag.all(:order => "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @metatags }
    end
  end

  # GET /metatags/new
  # GET /metatags/new.xml
  def new
    @metatag = Metatag.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @metatag }
    end
  end

  # GET /metatags/1/edit
  def edit
    @metatag = Metatag.find(params[:id])
  end

  # POST /metatags
  # POST /metatags.xml
  def create
    @metatag = Metatag.new(params[:metatag])
      if @metatag.save
         render :partial => 'metatag', :object => @metatag
      end
  end

  # PUT /metatags/1
  # PUT /metatags/1.xml
  def update
    @metatag = Metatag.find(params[:id])

    respond_to do |format|
      if @metatag.update_attributes(params[:metatag])
        flash[:notice] = 'Metatag was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @metatag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /metatags/1
  # DELETE /metatags/1.xml
  def destroy
    @metatag = Metatag.find(params[:id])
    @metatag.destroy

    respond_to do |format|
      flash[:notice] = 'Metatag was successfully deleted.'
      format.html { redirect_to(admin_metatags_url) }
      format.xml  { head :ok }
    end
  end
  
  def sort
  params[:metatag].each_with_index do |id, index|
    Metatag.update_all(['position=?', index+1], ['id=?', id])
  end
  render :nothing => true
  end

end
