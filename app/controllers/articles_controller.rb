class ArticlesController < ApplicationController
  uses_tiny_mce :options => { :theme => 'advanced' }
  before_filter :authenticate_presenter, :only => [:new, :create]
  before_filter :authenticate_author, :only => [:edit, :update, :destroy]
  def index
    @articles = Article.where("start < ? and end > ?", Time.now, Time.now).order("start DESC")
    #find :all , :conditions => {:start => (from..to) }, :order => "created_at"
  end

  def show
    @article  = Article.find(params[:id])
    @comments = @article.comments
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(params[:article])
    if current_user and current_user.is_presenter and @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end



  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if authenticate_author and @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to article_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if authenticate_author
      @article.destroy
      flash[:notice] = "Successfully destroyed article."
    end
    redirect_to articles_url
  end



  def authenticate_presenter
    unless current_user and current_user.is_presenter
      flash[:error] = "Permission denied"
      redirect_to root_url and return false 
    else
      return true
    end      
  end  
  
  def authenticate_author
    unless current_user and current_user.articles.include? Article.find(params[:id])
      flash[:error] = "Permission denied"
      redirect_to root_url and return false 
    else
      return true
    end      
  end 
end
