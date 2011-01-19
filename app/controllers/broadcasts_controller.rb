class BroadcastsController < ApplicationController
  def index
    @broadcasts = Broadcast.order('name').find_all_by_is_active(true)
  end

  def show
    @broadcast = Broadcast.find(params[:id])
  end


  def edit
    @broadcast = Broadcast.find(params[:id])
  end

end
