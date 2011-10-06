class CommentsController < ApplicationController
  
  def index
    @commentable = find_commentable
    @comments = @commentable.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def show
    @comment = @article.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
    @commentable = find_commentable
    @comment = @commentable.comments.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def edit
    @comment = @article.comments.find(params[:id])
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.ip = request.remote_ip
    if @comment.spam != "4"
      flash[:notice] = "Comment Marked as Spam"
      redirect_to [@commentable]
    else
      if @comment.save
        flash[:notice] = "Successfully created comment."
        redirect_to [@commentable]
      else
        render :action => 'new'
      end
    end
  end

  def update
    @comment = @article.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(article_comments_url(@article)) }
      format.xml  { head :ok }
    end
  end
  
  private

  def find_commentable
    params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
    end
    nil
  end

end