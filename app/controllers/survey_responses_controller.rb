
class SurveyResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @survey_response = @survey.responses.build
    create_responses_and_associate(@survey)
  end

  private

    def create_responses_and_associate(survey)
      survey.questions.each do |question|
        @survey_response.submitted_answers.build(question: question)
      end
    end
end
