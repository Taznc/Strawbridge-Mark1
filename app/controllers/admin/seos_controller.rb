class Admin::SeosController < ApplicationController
  before_filter :login_required
  before_filter :check_administrator_role
  layout "admin"
   require 'rubygems'
   require 'rugalytics'

   Rugalytics.login 'james@cleverstart.com', 'patricia12'

  
  def pageviews
    profile = Rugalytics.default_profile
    report = profile.pageviews_report

    @profile = profile
    @test = report.pageviews_by_day
  end

  def trafficsources
    profile = Rugalytics.default_profile
    report = profile.traffic_sources_report
    
    @reportname = report.name

    @reportstart = report.start_date

    @reportend = report.end_date

    @percent = report.source_items.collect{|s| "#{s.percentage_visits}"}
    @source = report.source_items.collect{|s| "#{s.sources}"}
    @sourcevisits = report.source_items.collect{|s| "#{s.visits}"}
    
    @kpercent = report.keyword_items.collect{|s| "#{s.percentage_visits}"}
    @ksource = report.keyword_items.collect{|s| "#{s.keywords}"}
    @ksourcevisits = report.keyword_items.collect{|s| "#{s.visits}"}

    @keyword = report.keyword_items.collect{|k| "#{k.keywords}: #{k.visits}"}

  end

  def dashboard
    @recentarticles = Article.find(:all, :order => "created_at DESC", :limit => 5)
    @articlecount = Article.find(:all)
    @lastarticle = Article.find(:last)
    @comments = Comment.find(:all)
    @recentcomments =Comment.find(:all, :order => "created_at DESC", :limit => 5)
  end
end
