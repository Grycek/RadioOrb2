class BroadcastsController < ApplicationController
  def index
    @broadcasts = Broadcast.all
  end

  def show
    @broadcast = Broadcast.find(params[:id])
  end

  def new
    @broadcast = Broadcast.new
  end

  def create
    @broadcast = Broadcast.new(params[:broadcast])
    if @broadcast.save
      flash[:notice] = "Successfully created broadcast."
      redirect_to @broadcast
    else
      render :action => 'new'
    end
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

  def destroy
    @broadcast = Broadcast.find(params[:id])
    @broadcast.destroy
    flash[:notice] = "Successfully destroyed broadcast."
    redirect_to broadcasts_url
  end
end
