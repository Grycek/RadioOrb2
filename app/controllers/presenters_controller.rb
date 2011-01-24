class PresentersController < ApplicationController
  before_filter :authenticate_presenter
  
  def index
      @articles   = current_user.articles.order('start_date DESC')
      @broadcasts = current_user.broadcasts
  end
  
  def authenticate_presenter
    unless current_user and current_user.is_presenter
      flash[:error] = "Permission denied"
      redirect_to root_url and return false 
    else
      return true
    end      
  end
end
