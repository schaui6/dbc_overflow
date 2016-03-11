post '/questions/:id/answers' do 
  @answer = Answer.new(responder_id: session[:user_id], question_id: params[:id], description: params[:answer_name])
    if @answer.save
      redirect "/questions/#{@answer.question_id}"
    else
    #validations failed. show the error to the user
      @errors = @answer.errors.full_message
      erb :'/questions/new'
    end

end




