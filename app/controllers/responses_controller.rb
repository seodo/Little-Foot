class ResponsesController < ApplicationController

  def create
    @survey = Survey.find_by(id: params[:survey_id].to_i)
    @question = Question.find_by(id: params[:question_id].to_i)
    # @responses = []
      params.each do |key, value|
        if ImpactItem.find_by(name: key) && value.to_i > 0
          impact_item = ImpactItem.find_by(name: key)
         # @responses <<
         Response.create(question_id: @question.id, survey_id: @survey.id, impact_item_id: impact_item.id, quantity: value.to_i)
        end
      end
    binding.pry
    if Question.find_by(id: (@question.id + 1)).present?
     @next_question = Question.find_by(id: (@question.id + 1))
     redirect_to survey_question_path(@survey, @next_question)
    else
      redirect_to survey_path(@survey)
    end
  end


end
