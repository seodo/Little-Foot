class QuestionsController < ApplicationController

def show

  @question = Question.find_by(id: params[:id])
  @survey = Survey.find_by(id: params[:survey_id])
  @foodfacts = Fact.select {|fact| fact.category_id == 1}
  @transfacts = Fact.select {|fact| fact.category_id == 2}
  @lifefacts = Fact.select {|fact| fact.category_id == 3}

end



end
