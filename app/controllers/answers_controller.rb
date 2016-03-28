class AnswersController < ApplicationController

  def index
    @answer = Answer.find(params[:id])
    @comment = Comment.new(commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: "Answer", description: params[:comment_name])
    if @comment.save
      redirect "/questions/#{@comment.commentable_id}"
    else
    #validations failed. show the error to the user
      @errors = @comment.errors.full_message
      render :'/questions/new'
    end
  end

  def create
      @answer = Answer.new(responder_id: session[:user_id], question_id: params[:id], description: params[:answer_name])
      if @answer.save
        redirect_to "/questions/#{@answer.question_id}"
      else
      #validations failed. show the error to the user
        @errors = @answer.errors.full_message
        render :'/questions/new'
      end
 
  end

end





