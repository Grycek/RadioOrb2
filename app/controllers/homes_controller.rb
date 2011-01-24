class HomesController < ApplicationController
  def index
  end
  
  def search
      if params[:search] != nil and params[:search][:title_contains] != nil
        search = params[:search][:title_contains]
      else
        search = ''
      end
      @search_art   = Article.search({:title_or_content_contains => search})
      @articles     = @search_art.order('start_date desc').all.paginate(:page => params[:page], :per_page => 10)
      @search_song  = Song.search({:title_or_artist_contains => search})
      @songs        = @search_song.order('artist asc').all.paginate(:page => params[:page], :per_page => 10)
      @search_play  = BroadcastPlaylist.search({:description_or_playlist_contains => search})
      @playlists    = @search_play.order('date desc').all.paginate(:page => params[:page], :per_page => 10)
  end
end
