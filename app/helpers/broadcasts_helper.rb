module BroadcastsHelper
  def authenticate_presenter
    return false unless current_user and (current_user.broadcasts.include? Broadcast.find(params[:id]) )
    return true
  end
end
