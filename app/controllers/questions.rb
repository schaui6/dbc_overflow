get '/questions/:id' do
  @question = Question.find(params[:id])
  @q_comments = @question.comments
  # binding.pry
  @answers = @question.answers
  # Look in app/views/index.erb
  erb :'/questions/show'
end