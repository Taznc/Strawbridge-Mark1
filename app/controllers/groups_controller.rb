class GroupsController < ApplicationController
  require 'rubygems'
  require 'RedCloth'
  
  def index
    @groups = Group.search(params[:search])
    #@womenunderforty = Group.find(:first, :conditions => { :id => "4" })
    #@menunderforty = Group.find(:first, :conditions => { :id => "2" })
    #@womenoverforty = Group.find(:first, :conditions => { :id => "3" })
    #@menoverforty = Group.find(:first, :conditions => { :id => "1" })
    #@menmid = Group.find(:first, :conditions => { :id => "44" })
    #@womenmid = Group.find(:first, :conditions => { :id => "45" })
    
    #@agingwomen = Group.find(:first, :conditions => { :id => "64" })
    @agingmen = Group.find(:first, :conditions => { :id => "65" })
    @focus = Group.find(:first, :conditions => { :id => "66" })
    @improved = Group.find(:first, :conditions => { :id => "67" })
    @dealing = Group.find(:first, :conditions => { :id => "68" })
    @preventing = Group.find(:first, :conditions => { :id => "69" })
    @immune = Group.find(:first, :conditions => { :id => "70" })
    @drrawls = Group.find(:first, :conditions => { :id => "80" })
    @atletic = Group.find(:first, :conditions => { :id => "81" })
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])
    @groups = Group.search(params[:search])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end
end
