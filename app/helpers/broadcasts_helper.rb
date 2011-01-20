require 'date'
module BroadcastsHelper
  def authenticate_presenter
    return false unless current_user and (current_user.broadcasts.include? Broadcast.find(params[:id]) )
    return true
  end
  
  def number_to_day_name(number)
     w = Date.new(1,1,3 + number)
     return w.strftime('%A')
  end
end
