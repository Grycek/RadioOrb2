class SurveysController < ApplicationController
  before_filter :authenticate_admin, :except => [:vote]
  before_filter :authenticate_user!, :only => [:vote]
  def index
    @surveys = Survey.order('id desc').all
  end

  def show
    @survey  = Survey.find(params[:id])
    @answers = SurveyQuestion.where(:survey_id => @survey.id).order('id asc')
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    answers = params[:answers][:list].split("\r\n")
    answers = answers.find_all {|ans| ans.strip() != ""}
    if @survey.save
      created_answers = []
      for ans in answers
        a = SurveyQuestion.new(:survey_id => @survey.id, :answer => ans.strip())
        created_answers << a
        unless a.save
          created_answers.each {|a| a.delete}
          @survey.delete
          flash[:error] = "Error"
          redirect_to new_survey_path
          return false
        end
      end
      flash[:notice] = "Successfully created survey."
      redirect_to @survey
    else
      render :action => 'new'
    end
  end


  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to surveys_url
  end
  
  def vote
      answer = current_user.survey_answers.new(:survey_question_id => params[:survey_question][:answer], :survey_id => Survey.last_survey.id)
      if answer.save
        flash[:notice] = "Success"
        redirect_to root_path
      else
        flash[:error] = "Fail. Probably you have voted before."
        redirect_to root_path
      end
  end
end
