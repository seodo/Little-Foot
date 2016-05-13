class ResponsesController < ApplicationController

def create
  binding.pry
  @response = Response.new(question_id: params[:question_id].to_i, survey_id: params[:survey_id].to_i)

  # iterate through the hash, for each key value pair instantiate a new response
  # iterate through each key value pair, if key == impact.item.name, && value is greater than 0, then create a new response with that impact item and value.
end










end
