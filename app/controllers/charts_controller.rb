class ChartsController < ApplicationController
  def index
    @charts = Chart.order('number desc').all
    @charts = @charts.paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @chart = Chart.find(params[:id])
  end

  def new
    @chart = Chart.new
  end

  def create
    last_chart = Chart.last_chart
    if last_chart != nil
        (flash[:error] = "Counting votes error"; redirect_to charts_path; return false) if not count_votes(last_chart)
    end
    @chart = Chart.new(params[:chart])
    if @chart.save
      flash[:notice] = "Successfully created chart."
      redirect_to @chart
    else
      render :action => 'new'
    end
  end

  def edit
    @chart = Chart.find(params[:id])
  end

  def update
    @chart = Chart.find(params[:id])
    if @chart.update_attributes(params[:chart])
      flash[:notice] = "Successfully updated chart."
      redirect_to chart_path(@chart)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @chart = Chart.find(params[:id])
    @chart.destroy
    flash[:notice] = "Successfully destroyed chart."
    redirect_to charts_path(@chart)
  end
  
  private
  def count_votes(chart)
    songs_active = Song.where(:is_active => true)
    results      = []
    songs_active.each do |song|
        #number of votes
        nb_of_votes = song.votes.where(:chart_id => chart.id).length
        result      = chart.results.new(:song_id => song.id, :nb_of_votes => nb_of_votes)
        results << result
    end
    results = results.sort_by {|res|   Song.find(res.song_id).artist }
    results = results.sort_by {|res|   res.nb_of_votes}
    results = results.reverse
    #Podliczanie wynikow - przypisywanie pozycji
    results[0].position = 1 if results[0] != nil
    position = 1
    ties     = 0
    for i in 1..(results.length-1)
      if results[i-1].nb_of_votes > results[i].nb_of_votes
        results[i].position = position + ties + 1
        position += 1 + ties
        ties = 0
      else
        results[i].position = position
        ties += 1
      end
    end
    ########
    #results.each_with_index {|res, index| puts res.song_id, res.nb_of_votes ; res.position = (index+1)}
    for res in results
        #if error happend - delete results
        (results.each {|res| res.delete}; return false) if not res.save
    end
    return true
  end
end
