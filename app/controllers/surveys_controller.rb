class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find_by(id: params[:id])
    if current_user.present?
      if current_user.surveys.include?(@survey)
        render 'show'
      else
        render partial: 'shared/unauthorized'
      end
    else
      @last_survey = Survey.last
      if @last_survey != @survey
        render partial: 'shared/unauthorized'
      end
    end
  end

  def create
    if logged_in?
      @survey = Survey.create(survey_params)
      @question = Question.first
      redirect_to survey_question_path(@survey, @question)
    else

       @survey = Survey.create(survey_params)
        @question = Question.first
      redirect_to survey_question_path(@survey, @question)
   end
  end

  private
  def survey_params
    params.require(:survey).permit(:latitude, :longitude).merge(user: current_user)
  end

end
