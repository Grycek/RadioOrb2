module BroadcastPlaylistsHelper
  def authenticate_presenter(broadcast = nil)
    broadcast = params[:broadcast_id] if broadcast == nil
    return false unless current_user and (current_user.broadcasts.include? Broadcast.find( broadcast ) )
    return true
  end
end
