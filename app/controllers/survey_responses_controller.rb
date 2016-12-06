class SurveyResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @survey_response = SurveyResponse.new
  end
end
