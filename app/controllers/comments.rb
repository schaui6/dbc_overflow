post '/questions/:id/comments' do 
  @comment = Comment.new(commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: "Question", description: params[:comment_name])
    if @comment.save
      redirect "/questions/#{@comment.commentable_id}"
    else
    #validations failed. show the error to the user
      @errors = @comment.errors.full_message
      erb :'/questions/new'
    end
end


post '/answers/:id/comments' do 
  @answer = Answer.find(params[:id])
  @comment = Comment.new(commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: "Answer", description: params[:comment_name])
    if @comment.save
      redirect "/questions/#{@comment.commentable_id}"
    else
    #validations failed. show the error to the user
      @errors = @comment.errors.full_message
      erb :'/questions/new'
    end
end