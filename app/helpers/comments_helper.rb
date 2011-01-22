module CommentsHelper


  def authenticate_presenter_or_author(broadcast = nil, comment = nil)
    broadcast = params[:broadcast_id] if broadcast == nil
    if comment == nil
      if params[:comment_id] == nil
        comment   = params[:id] 
      else
        comment   = params[:comment_id]
      end
    end
    return false unless current_user and (current_user and (current_user.broadcasts.include? Broadcast.find( broadcast) )) or (current_user and (current_user.comments.include? Comment.find( comment ) ))
    return true
  end
  
end
