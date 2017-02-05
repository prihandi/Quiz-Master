class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  

  def index
    @questions = Question.order("updated_at desc").page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to action: "index"
      flash.now[:success] = "Question was successfully created"
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to action: "index"
      flash.now[:success] = "Question was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:question, :answer, :submitted_answer)
    end
end
