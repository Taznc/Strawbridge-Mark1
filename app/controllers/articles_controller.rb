class ArticlesController < ApplicationController
  require 'rubygems'
  require 'RedCloth'
  
  def index
    @articles = Article.ordered.search(params[:search])
    @article = Article.find(:all)
    @article_months = @article.group_by { |t| t.created_at.beginning_of_month }
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      format.rss { render :layout=>false} 
    end
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.find(:all)
    @article_months = @articles.group_by { |t| t.created_at.beginning_of_month }

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
      format.rss { render :layout=>false} 
    end
  end
  
end
