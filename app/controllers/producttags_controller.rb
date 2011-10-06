class ProducttagsController < ApplicationController
  # GET /producttags
  # GET /producttags.xml
  def index
    @producttags = Producttag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @producttags }
    end
  end

  # GET /producttags/1
  # GET /producttags/1.xml
  def show
    @producttag = Producttag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @producttag }
    end
  end

end
