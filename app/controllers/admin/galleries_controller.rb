class Admin::GalleriesController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"

    # GET /photos
  # GET /photos.xml

  def index
    @galleries = Gallery.all
    @page = Page.find(params[:page_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
      format.js
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @gallery = Gallery.new
    @page = Page.find(params[:page_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
    @page = Page.find(params[:page_id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @gallery = Gallery.new(params[:gallery])
    @gallery.photo_content_type = MIME::Types.type_for(@gallery.photo_file_name).to_s
    @gallery.page_id = params[:page_id]
    respond_to do |format|
      if @gallery.save
        flash[:notice] = 'Photo was successfully created.'
        format.html { redirect_to(@gallery) }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
        format.json { render :json => { :result => 'success', :photo => admin_gallery_path(@gallery) } }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
        format.json { render :json => { :result => 'error', :error => @asset.errors.full_messages.to_sentence } }
        format.js
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @gallery = Gallery.find(params[:id])
    @page = Page.find(params[:page_id])
    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Gallery was successfully updated.'
        format.html { redirect_to admin_page_galleries_path(params[:page_id]) }
        format.xml  { head :ok }
        format.json { render :json => { :result => 'success', :photo => admin_gallery_path(@gallery) } }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
        format.json { render :json => { :result => 'error', :error => @asset.errors.full_messages.to_sentence } }
        format.js
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to admin_page_galleries_path(params[:page_id]) }
      format.xml  { head :ok }
    end
  end

end
