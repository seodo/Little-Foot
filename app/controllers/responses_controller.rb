class ResponsesController < ApplicationController

def create
  binding.pry
  @response = Response.new(question_id: params[:question_id].to_i, survey_id: params[:survey_id].to_i)
end










end
