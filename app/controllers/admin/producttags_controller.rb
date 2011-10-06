class Admin::ProducttagsController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
  def index
    @producttags = Producttag.all(:order => "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @producttags }
    end
  end

  # GET /producttags/new
  # GET /producttags/new.xml
  def new
    @producttag = Producttag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @producttag }
    end
  end

  # GET /producttags/1/edit
  def edit
    @producttag = Producttag.find(params[:id])
  end

  # POST /producttags
  # POST /producttags.xml
  def create
    @producttag = Producttag.new(params[:producttag])

    respond_to do |format|
      if @producttag.save
        flash[:notice] = 'Producttag was successfully created.'
        format.html { redirect_to :action => 'index' }
        format.xml  { render :xml => @producttag, :status => :created, :location => @producttag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @producttag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /producttags/1
  # PUT /producttags/1.xml
  def update
    @producttag = Producttag.find(params[:id])

    respond_to do |format|
      if @producttag.update_attributes(params[:producttag])
        flash[:notice] = 'Producttag was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @producttag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /producttags/1
  # DELETE /producttags/1.xml
  def destroy
    @producttag = Producttag.find(params[:id])
    @producttag.destroy

    respond_to do |format|
      format.html { redirect_to(producttags_url) }
      format.xml  { head :ok }
    end
  end
end
