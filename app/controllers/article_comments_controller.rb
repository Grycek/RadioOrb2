class ArticleCommentsController < ApplicationController
  #TODO - autentykacja prezentera i autora
  before_filter :authenticate_user!
  before_filter :authenticate_article_or_comment_author, :only => [:edit, :update, :destroy]
  
  def create
    @article            = Article.find(params[:article_id])
    @comments           = @article.comments
    @comment            = @comments.new(params[:comment])
    @comment.user_id    = current_user.id
    if authenticate_user! and @comment.save and ArticleComment.create(:article_id => @article.id, :comment_id => @comment.id)
      flash[:notice] = "Successfully comment."
      redirect_to article_path(@article)
    else
      @comment.delete
      render :action => 'show', :controller => "articles"
    end
  end
  


  def edit
    @article            = Article.find(params[:article_id])
    @comment            = Comment.find(params[:id])
  end
  
  def update
    @article            = Article.find(params[:article_id])
    @comment            = Comment.find(params[:id])
    if authenticate_article_or_comment_author and @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully edit comment."
      redirect_to article_path(@article)
    else
      render :action => 'show', :controller => "articles"
    end
  end
  
  def destroy
    @article            = Article.find(params[:article_id])
    @comment            = Comment.find(params[:id])
    if authenticate_article_or_comment_author
      @comment.destroy
      flash[:notice] = "Successfully destroyed broadcast playlist."
    end
    redirect_to article_path(@article)
  end
  
  
  
  def authenticate_article_or_comment_author(article = nil, comment = nil)
    comment = Comment.find( params[:id] ) unless comment
    article = Article.find( params[:article_id] ) unless article
    unless current_user and ( (current_user.articles.include? article) or (current_user.comments.include? comment))
        flash[:error] = "Permission denied"  
        redirect_to article_path(article) and return false 
    else
        return true
    end
  end
  
end
