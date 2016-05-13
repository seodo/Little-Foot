class ResponsesController < ApplicationController

def create
  @response = Response.new(question_id: params[:question_id].to_i, survey_id: params[:survey_id].to_i)
@responses = []
  params.each do |k,v|
    if ImpactItem.find_by(name: k) && v.to_i > 0
      impact_item = ImpactItem.find_by(name: k)
     @responses << Response.create(question_id: params[:question_id].to_i, survey_id: params[:survey_id].to_i, impact_item_id: impact_item.id, quantity: v.to_i)
    end
  end
  # logic to get to the next question (2)
end










end
