class SurveysController < ApplicationController

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
      @survey = Survey.create(user_id: current_user.id)
      @question = Question.find_by(id: 1)
      redirect_to survey_question_path(@survey, @question)
    else
       @survey = Survey.create()
        @question = Question.find_by(id: 1)
      redirect_to survey_question_path(@survey, @question)
   end
  end

end
