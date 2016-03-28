class QuestionsController < ApplicationController
  def index
  	@user = User.find(session[:id])
  	@questions = Question.all
  	render 'index'
  end

  def new
    #return a from for creating a new question
    # @user = User.find(session[:id])
    if request.xhr?
      render :'questions/_create_question_form', layout: false
    else
      render new_question_path
    end
  end

  def create
    #create a new question
    @question = Question.new(params[:question])
     if @question.save #validation succeeded
      if request.xhr?
        render :'show', locals: {question: @question}, layout: false
      else
        #not sure exactly where we want to redirect if not xhr
        redirect_to "/questions/#{@question.id}"
      end
     else
      #validations failed. show the error to the user
      @errors = @question.errors.full_message
      render :'questions/new'
     end
  end

  def show
    @user = User.find(session[:id])
    @question = Question.find(params[:id])
    @q_comments = @question.comments
    @answers = @question.answers
    # Look in app/views/index.erb
    render :'/questions/show'
  end
end
