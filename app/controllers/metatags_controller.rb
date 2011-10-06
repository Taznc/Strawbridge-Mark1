class MetatagsController < ApplicationController
  # GET /metatags
  # GET /metatags.xml
  def index
    @metatags = Metatag.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @metatags }
    end
  end

  # GET /metatags/1
  # GET /metatags/1.xml
  def show
    @metatag = Metatag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @metatag }
    end
  end

end