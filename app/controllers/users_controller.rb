get '/users/:id' do
  if session[:id]
    @user = User.find_by(id: params[:id])
    @questions = Question.where(poster_id: params[:id])
    @answers = Answer.where(responder_id: params[:id])
    erb :users
  else
    erb :index
  end
end

get 'quick_question' do

  erb :_quick_question
end

get 'quick_answer' do

  erb :_quick_answer
end