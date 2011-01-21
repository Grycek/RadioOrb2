class BroadcastPlaylistsController < ApplicationController
  before_filter :authenticate_presenter, :except => [:show]

  def show
    @broadcast           = Broadcast.find(params[:broadcast_id])
    @broadcast_playlists = @broadcast.broadcast_playlists
    @broadcast_playlist  = @broadcast_playlists.find(params[:id])
  end

  def new
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = @broadcast.broadcast_playlists.new
  end

  def create
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = @broadcast.broadcast_playlists.new(params[:broadcast_playlist])
    if authenticate_presenter and @broadcast_playlist.save
      flash[:notice] = "Successfully created broadcast playlist."
      redirect_to @broadcast
    else
      render :action => 'new'
    end
  end


  def edit
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:id])
  end

  def update
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:id])
    if authenticate_presenter and @broadcast_playlist.update_attributes(params[:broadcast_playlist])
      flash[:notice] = "Successfully updated broadcast playlist."
      redirect_to broadcast_url(params[:broadcast_id])
    else
      render :action => 'edit'
    end
  end

  def destroy
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:id])
    if authenticate_presenter
      @broadcast_playlist.destroy
      flash[:notice] = "Successfully destroyed broadcast playlist."
    end
    redirect_to broadcast_url(params[:broadcast_id])
  end
  
  def authenticate_presenter
    unless current_user and (current_user.broadcasts.include? Broadcast.find(params[:broadcast_id]) )
      flash[:error] = "Permission denied"
      redirect_to broadcast_url(params[:broadcast_id]) and return false 
    else
      return true
    end
  end
end
