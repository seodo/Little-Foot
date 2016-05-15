class QuestionsController < ApplicationController

def show

  @question = Question.find_by(id: params[:id])
  @survey = Survey.find_by(id: params[:survey_id])
end



end
