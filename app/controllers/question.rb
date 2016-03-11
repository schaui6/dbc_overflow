# get '/questions' do
#   #display a list of all questions
# end

get '/questions/new' do
  #return a from for creating a new question

  erb :'questions/new'
end

post '/questions' do
  #create a new question

  @question = Question.create()
end

# get '/question/:id' do
#   #display a specific question

# end

# get '/question/:id/edit' do
#   #edit a specific question

# end

# delete '/question/:id' do
#   #delete a specific question
# end
