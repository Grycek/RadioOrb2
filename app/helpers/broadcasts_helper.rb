require 'date'
module BroadcastsHelper
  def authenticate_presenter(broadcast = nil)
    broadcast = params[:id] if broadcast == nil
    return false unless current_user and (current_user.broadcasts.include? Broadcast.find( broadcast ) )
    return true
  end
  
  def number_to_day_name(number)
     w = Date.new(1,1,3 + number)
     return I18n.t w.strftime('%A')
  end
end
