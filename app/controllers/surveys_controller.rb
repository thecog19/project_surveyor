class SurveysController < ApplicationController

  def index
    @survey = Survey.all
  end

  def new
    @survey = Survey.new
    @questions = Question.new
  end

  def create
    @survey = Survey.new(strong_params)
    if @survey.save
      flash[:success] = "Survey Created"
      redirect_to @survey
    else
      flash.now[:danger] = "Submission Failed"
      render "new"
    end
  end

 

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.all
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(strong_params)
      flash[:success] = "Survey Updated"
      redirect_to @survey
    else
      flash.now[:danger] = "Update Failed"
      render "edit"
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:success] = "Survey Destroyed"
    redirect_to surveys_path
  end

  def strong_params
    params.require(:survey).permit(:name, :id, { :questions_attributes => [:body, :id,:type_id, :_destroy] })
  end
end
