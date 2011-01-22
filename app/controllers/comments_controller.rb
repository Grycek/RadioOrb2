class CommentsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :authenticate_presenter_or_author, :except => [:create]
    
    
  def create
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:broadcast_playlist_id])
    @comments           = @broadcast_playlist.comments
    @comment            = @comments.new(params[:comment])
    @comment.user_id    = current_user.id
    if authenticate_user! and @comment.save and PlaylistComment.create(:broadcast_playlist_id => @broadcast_playlist.id, :comment_id => @comment.id)
      flash[:notice] = "Successfully comment."
      redirect_to broadcast_broadcast_playlist_path(@broadcast, @broadcast_playlist)
    else
      @comment.delete
      render :action => 'show', :controller => "broadcast_playlists"
    end
  end
  
  
  def edit
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:broadcast_playlist_id])
    @comment            = Comment.find(params[:id])
  end
  
  
  def update
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:broadcast_playlist_id])
    @comment            = Comment.find(params[:id])
    if authenticate_presenter_or_author and @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully edit comment."
      redirect_to broadcast_broadcast_playlist_path(@broadcast, @broadcast_playlist)
    else
      render :action => 'edit'
    end
  end
  
  
  def destroy
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:broadcast_playlist_id])
    @comment            = Comment.find(params[:id])
    if authenticate_presenter_or_author
      @comment.destroy
      flash[:notice] = "Successfully destroyed broadcast playlist."
    end
    redirect_to broadcast_broadcast_playlist_path(@broadcast, @broadcast_playlist)
  end


  
  def authenticate_presenter_or_author
    unless (current_user and (current_user.broadcasts.include? Broadcast.find(params[:broadcast_id]) )) or (current_user and (current_user.comments.include? Comment.find(params[:id]) ))
      flash[:error] = "Permission denied"
      redirect_to broadcast_broadcast_playlist_url(params[:broadcast_id], params[:broadcast_playlist_id]) and return false 
    else
      return true
    end
  end
end
