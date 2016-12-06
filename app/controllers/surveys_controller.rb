class SurveysController < ApplicationController
  before_action :find_survey, except: [:index, :new, :create]

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.save ? succesful_create : failed_create
  end

  def show
  end

  def edit
    @questions = @survey.questions.all
  end

  def update
    @survey.update(survey_params) ? successful_update : failed_update
  end

  def destroy
    @survey.destroy ? successful_destroy : failed_destroy
  end

  private
    def succesful_create
      flash[:success] = ["#{ @survey.name } Created"]
      redirect_to @survey
    end

    def failed_create
      flash.now[:danger] = @survey.errors.full_messages
      render :new
    end

    def successful_update
      flash[:success] = ["#{ @survey.name } Updated"]
      redirect_to @survey
    end

    def failed_update
      flash.now[:danger] = @survey.errors.full_messages
      render :edit
    end

    def successful_destroy
      flash[:success] = ["#{ @survey.name } Destroyed"]
      redirect_to surveys_url
    end

    def failed_destroy
      flash[:danger] = @survey.errors.full_messages
      redirect_to surveys_url
    end

    def survey_params
      params.require(:survey).permit(:name, :id, :description, question_ids: [])
    end

    def find_survey
      @survey = Survey.find(params[:id])
    end
end
