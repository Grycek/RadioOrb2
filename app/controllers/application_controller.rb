class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate_admin
      unless current_user and current_user.is_admin
          flash[:error] = "Permission denied"
          redirect_to root_path and return false
      else
          return true
      end
  end
end
