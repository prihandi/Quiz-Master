class HomeController < ApplicationController

  def index
    @random_id = Question.pluck(:id).sample
    @questions = Question.select(:id, :question).order("updated_at desc").page(params[:page]).per(5)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @question = Question.select(:id, :question).find(params[:id])
    @question.submitted_answer =''
    @status = -1  # status unset 
    render 'show'
  end

  def check_answer
    @question = Question.find(params[:id])
    @question.update_attributes(question_param)
    if @question.is_correct?
      flash.now[:success] = "Congratulation. Your answer is correct"
      @status = 1
      render 'show'
    else
      flash.now[:alert] = "Your answer is not correct. Try again !"
      render 'show'
      @status = 0
    end 
  end

  def question_param
    params.require(:question).permit(:submitted_answer)
  end
end
