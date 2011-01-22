class ArticleCommentsController < ApplicationController
  #TODO - autentykacja prezentera i autora
  def create
    @article = current_user.articles.new(params[:article])
    if current_user and current_user.is_presenter and @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  def create
    @article            = Article.find(params[:format])
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
  end

  def authenticate_article_or_comment_author(article, comment)
    #TODO - zmienic autorycacje (comments.articles intersect current_user.articles)
    redirect_to root_path and return false unless current_user and (( not (current_user.articles & comment.articles).is_empty? ) or (current_user.comments.include? Comment.find( comment )))
    return true
  end
  
end
