
class QuestionsController < ApplicationController
  before_action :find_question, only: [:edit, :update]

  def new
    @question = Question.new
    #@question_types = QuestionType.all
    # appearing as nil in view though QuestionType.all returns array there
  end

  def create
    cookies[:options] = params[:options]
    @question = Question.new(question_params)
    @question.save ? successful_create : failed_create
  end

  def edit
    cookies[:options].to_i.times do
      @question.possible_answers.build
    end
  end

  def update
    cookies[:options] = 0
    @question.update(question_params) ? successful_update : failed_update
  end

  private
    def successful_create
      flash[:success] = ["Question Created"]
      redirect_to edit_survey_question_path(params[:survey_id], @question)
    end

    def failed_create
      flash.now[:danger] = @question.errors.full_messages
      render :new
    end

    def successful_update
      flash[:success] = ["Question Updated"]
      redirect_to survey_url(params[:survey_id])
    end

    def failed_update
      flash.now[:danger] = @question.errors.full_messages
      render :edit
    end

    def question_params
      params.require(:question).permit(:body, :survey_id, :question_type_id,
                                       :max_answers, :required)
    end

    def find_question
      @question = Question.find(params[:id])
    end
end
