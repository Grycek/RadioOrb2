class VotesController < ApplicationController
    before_filter :authenticate_user!
    
    def new
        @songs = Song.order('artist asc').where(:is_active => true)
    end
    
    def create
      @songs   = Song.order('artist asc').where(:is_active => true)
      #TODO - szukanie ostatniego notowania
      @chart   = Chart.last_chart
      song_ids = params.find_all {|key, val| val == '1'}
      song_ids = song_ids.map {|key,val| key}
      song_ids = song_ids.find_all {|id| s = Song.find(id); s and s.is_active}
      if song_ids.length > 10
          flash[:error] = 'Too many votes'
          render :action => 'new'
          return
      end
      
      
      votes = []
      song_ids.each do |song_id|
        vote = @chart.votes.new(:user_id => current_user.id, :song_id => song_id)
        votes << vote
        unless vote.save
          flash[:error] = "Unexpected error"
          votes.each {|v| v.delete}
          break
        end
      end
      redirect_to new_vote_path
      
    end
end
