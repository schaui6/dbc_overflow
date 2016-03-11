get '/users/:id' do
  if session[:id]
  # All user's questions

    @user = User.find_by(id: params[:id])
    @questions = Question.where(poster_id: @user.id)

  # All questions from answers the user's responded to
    questions_id = User.find(@user.id).answers.pluck('DISTINCT question_id')
    @questions_from_answer = Question.find(questions_id)
    erb :users
  else
    erb :index
  end
end


# To be used for future features for hover effect
get 'quick_question' do

  erb :_quick_question
end

# To be used for future features for hover effect
get 'quick_answer' do

  erb :_quick_answer
end