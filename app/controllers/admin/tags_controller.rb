class Admin::TagsController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
  
  def index
    @tags = Tag.all(:order => "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end
  
  # GET /tags/new
  # GET /tags/new.xml
  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.xml
  def create
    @tag = Tag.new(params[:tag])
      if @tag.save
         render :partial => 'tag', :object => @tag
      end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        flash[:notice] = 'Tag was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |type|
    format.html { redirect_to(admin_tags_url)}
    format.js
    end

  end
  
  def sort
  params[:tag].each_with_index do |id, index|
    Tag.update_all(['position=?', index+1], ['id=?', id])
  end
  render :nothing => true
  end

end
