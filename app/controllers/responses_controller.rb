class ResponsesController < ApplicationController


  def create
    @survey = Survey.find_by(id: params[:survey_id].to_i)
    @question = Question.find_by(id: params[:question_id].to_i)
    dine_out_multiplyer = 1
    if params[:dine_out]
      #could not figure out how to add this in the reduce final survey results
      dine_out_multiplyer = 3.67
      @multiplier = Multiplier.create(name: "dine out meal", value: 3.67, suggestion: "Try eating at home for high impact carbon items to lower your footprint!")
    end
      params.each do |key, value|
        if ImpactItem.find_by(name: key) && value.to_i > 0
          impact_item = ImpactItem.find_by(name: key)
          Response.create(question_id: @question.id, survey_id: @survey.id, impact_item_id: impact_item.id, quantity: value.to_i * dine_out_multiplyer, multiplier: @multiplier)
        end
      end
    if Question.find_by(id: (@question.id + 1)).present?
     @next_question = Question.find_by(id: (@question.id + 1))
     redirect_to survey_question_path(@survey, @next_question)
    else
      redirect_to survey_path(@survey)
    end
  end

end
