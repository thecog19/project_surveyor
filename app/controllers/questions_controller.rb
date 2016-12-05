class QuestionsController < ApplicationController

  before_action :get_question, only: [:edit, :update]

  def new
    @question = Question.new
  end

  def create

  end

  def edit

  end

  def update

  end

  private
  def get_question
    @question = Question.find(params[:id])
  end

  def strong_params
    params.require(:question).permit(:body, :survey_id, :type_id) 
  end
end
