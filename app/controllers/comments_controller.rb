class CommentsController < ApplicationController


  def create
    @comment = Comment.new(commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: "Question", description: params[:comment_name])
      if @comment.save
        redirect_to "/questions/#{@comment.commentable_id}"
      else
      #validations failed. show the error to the user
        @errors = @comment.errors.full_message
        render :'/questions/new'
      end
  end



end



