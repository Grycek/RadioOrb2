class SongsController < ApplicationController
  before_filter :authenticate_admin
  def index
    @songs = Song.order('is_active desc').order('artist').all
    @songs = @songs.paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @song    = Song.find(params[:id])
    @results = @song.results.order('chart_id asc')
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      flash[:notice] = "Successfully created song."
      redirect_to @song
    else
      render :action => 'new'
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:notice] = "Successfully updated song."
      redirect_to song_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Successfully destroyed song."
    redirect_to songs_url
  end
end
