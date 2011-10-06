class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  require 'rubygems'
  require 'RedCloth'
  
  def index
    @pages = Page.search(*params.values_at(:page, :searchpast))

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end
  
  def send_contact_form
     if request.post?
       ContactMailer::deliver_contact(params[:author])
       redirect_to :action => 'show', :id => '40-thank-you-for-contacting-us'
       flash[:notice] = "Thanks for contacting us, we will be in touch with you soon."
     else
       flash[:notice] = "Oops, That wasn't supposed to happen. Try again or email info@strawbridge.com"
     end
 end
 
  def send_contactpage_form
     if request.post?
       
       ContactMailer::deliver_contactus(params[:author])
       redirect_to :action => 'show', :id => '40-thank-you-for-contacting-us'
     else
       flash[:notice] = "Oops, That wasn't supposed to happen. Try again or email info@strawbridge.com"
     end
  end
  
 
  def search
    @pages = Page.searchpages(*params.values_at(:page, :searchterm))
  end
  

  
  
end
