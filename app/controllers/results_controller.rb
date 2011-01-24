class ResultsController < ApplicationController
  def index
      @charts = Chart.order('id desc').all
      @charts = @charts.paginate(:page => params[:page], :per_page => 50)
  end
  
  def show
      @chart   = Chart.find(params[:id])
      @results = @chart.results.order('position asc')
  end
end
