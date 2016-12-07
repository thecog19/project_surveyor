
class SurveyResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @survey_response = @survey.responses.build
    create_responses_and_associate(@survey)
  end

  def create
    @survey_response = SurveyResponse.new(survey_response_params)
    @survey_response.save ? successful_create : failed_create
  end

  private

    def survey_response_params
      params.require(:survey_response).permit(:survey_id,
        submitted_answers_attributes: [:id, :answer_ids])
    end

    def create_responses_and_associate(survey)
      survey.questions.each do |question|
        @survey_response.submitted_answers.build(question: question)
      end
    end

    def successful_create
      flash[:success] = ["Question Created"]
      redirect_to "root"
    end

    def failed_create
      flash.now[:danger] = @survey_response.errors.full_messages
      redirect_to "root"
    end
end
