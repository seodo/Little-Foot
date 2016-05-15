class SurveysController < ApplicationController

  def show
    @survey = Survey.find_by(id: params[:id])
    if current_user.present?
      @last_user_survey = current_user.surveys.last
      if @last_user_survey != @survey
        render partial: 'shared/unauthorized'
      end
    else
      @last_survey = Survey.last
      binding.pry
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
