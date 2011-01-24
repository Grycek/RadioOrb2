class BroadcastsController < ApplicationController
  before_filter :authenticate_presenter, :only => [:edit, :update]
  
  def index
    #@broadcasts = Broadcast.find_all_by_is_active(true)
    @broadcasts = Broadcast.where(:is_active => true)
    @days = []
    for i in 0..6
      @days << @broadcasts.where(:day => i).order('hour_start asc')
    end
  end

  def show
    @broadcast           = Broadcast.find(params[:id])
    @broadcast_playlists = @broadcast.broadcast_playlists
    @presenters          = @broadcast.users
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
    unless current_user and (current_user.broadcasts.include? Broadcast.find(params[:id]) )
      flash[:error] = "Permission denied"
      redirect_to broadcast_url(params[:id]) and return false 
    else
      return true
    end
  end
  
end
