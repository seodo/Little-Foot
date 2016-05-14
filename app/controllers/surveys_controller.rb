class SurveysController < ApplicationController


  def show
    @survey = Survey.find_by(id: params[:id])
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
