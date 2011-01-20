require "rails_admin/application_controller"

module RailsAdmin
  class ApplicationController < ::ApplicationController
    before_filter :authenticate_user!
    before_filter :authenticate_admin
    
    def authenticate_admin
        redirect_to root_path and false unless current_user and current_user.is_admin
    end
  end
end
