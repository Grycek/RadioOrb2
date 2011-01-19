class BroadcastsController < ApplicationController
  def index
    @broadcasts = Broadcast.order('name').find_all_by_is_active(true)
  end

  def show
    @broadcast  = Broadcast.find(params[:id])
    @presenters = @broadcast.users
  end


  def edit
    @broadcast = Broadcast.find(params[:id])
  end

  def update
    @broadcast = Broadcast.find(params[:id])
    if @broadcast.update_attributes(params[:broadcast])
      flash[:notice] = "Successfully updated broadcast."
      redirect_to broadcast_url
    else
      render :action => 'edit'
    end
  end
end
