class ChartsController < ApplicationController
  def index
    @charts = Chart.order('number asc').all
    @charts = @charts.paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @chart = Chart.find(params[:id])
  end

  def new
    @chart = Chart.new
  end

  def create
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
      redirect_to chart_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @chart = Chart.find(params[:id])
    @chart.destroy
    flash[:notice] = "Successfully destroyed chart."
    redirect_to charts_url
  end
end
