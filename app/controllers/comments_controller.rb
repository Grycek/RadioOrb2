class CommentsController < ApplicationController
    before_filter :authenticate_user!
    
    
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
  
  #TODO! - dodatkowa autententykacja autora komentarza
  def edit
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:broadcast_playlist_id])
    @comment            = Comment.find(params[:id])
  end
  
  #TODO! - dodatkowa autententykacja autora komentarza
  def update
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:broadcast_playlist_id])
    @comment            = Comment.find(params[:id])
    if authenticate_user! and @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully edit comment."
      redirect_to broadcast_broadcast_playlist_path(@broadcast, @broadcast_playlist)
    else
      render :action => 'edit'
    end
  end
  
  #TODO! - dodatkowa autententykacja autora komentarza
  def destroy
    @broadcast          = Broadcast.find(params[:broadcast_id])
    @broadcast_playlist = BroadcastPlaylist.find(params[:broadcast_playlist_id])
    @comment            = Comment.find(params[:id])
    if authenticate_user!
      @comment.destroy
      flash[:notice] = "Successfully destroyed broadcast playlist."
    end
    redirect_to broadcast_broadcast_playlist_path(@broadcast, @broadcast_playlist)
  end
end
