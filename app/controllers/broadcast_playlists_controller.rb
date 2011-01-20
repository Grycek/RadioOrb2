class BroadcastPlaylistsController < ApplicationController

  def show
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = @broadcast.broadcast_playlists.find(params[:id])
  end

  def new
    @broadcast = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = @broadcast.broadcast_playlists.new
  end

  def create
    @broadcast = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = @broadcast.broadcast_playlists.new(params[:broadcast_playlist])
    if @broadcast_playlist.save
      flash[:notice] = "Successfully created broadcast playlist."
      redirect_to @broadcast_playlist
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
    if @broadcast_playlist.update_attributes(params[:broadcast_playlist])
      flash[:notice] = "Successfully updated broadcast playlist."
      redirect_to broadcast_playlist_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @broadcast_playlist = BroadcastPlaylist.find(params[:id])
    @broadcast_playlist.destroy
    flash[:notice] = "Successfully destroyed broadcast playlist."
    redirect_to broadcast_playlists_url
  end
end
