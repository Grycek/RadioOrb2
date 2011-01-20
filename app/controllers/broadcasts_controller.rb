class BroadcastsController < ApplicationController
  before_filter :authenticate_presenter, :only => [:edit, :update]
  
  def index
    @broadcasts = Broadcast.order('name').find_all_by_is_active(true)
  end

  def show
    @broadcast  = Broadcast.find(params[:id])
    @presenters = @broadcast.users
  end


  def edit
    @broadcast = Broadcast.find(params[:id])
  end

  def update
    @broadcast = Broadcast.find(params[:id])
    if authenticate_presenter and @broadcast.update_attributes(params[:broadcast])
      flash[:notice] = "Successfully updated broadcast."
      redirect_to broadcast_url
    else
      render :action => 'edit'
    end
  end
  
  
  def authenticate_presenter
    redirect_to broadcast_url and return false unless current_user and (current_user.broadcasts.include? Broadcast.find(params[:id]) )
    return true
  end
  
end
