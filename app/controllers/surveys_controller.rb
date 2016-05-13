class SurveysController < ApplicationController


  def show

  end

  def create
    #if logged_in?
      @survey = Survey.create()
      @question = Question.find_by(id: 1)
      redirect_to survey_question_path(@survey, @question)
    #end
  end










end
