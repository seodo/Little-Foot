class SurveysController < ApplicationController


  def new
    #if logged_in?
      @survey = Survey.new()
      @questions
    #end
  end











end
