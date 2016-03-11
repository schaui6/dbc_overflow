# get '/questions' do
#   #display a list of all questions
# end

get '/questions/new' do
  #return a from for creating a new question
  if request.xhr?
  erb :'questions/_create_question_form', layout: false
  else
    erb :'questions/new'
  end
end

post '/questions' do
  #create a new question
  @question = Question.new(params[:question])
   if @question.save #validation succeeded
    if request.xhr?
      erb :'show', locals: {question: @question}, layout: false
    else
      #not sure exactly where we want to redirect if not xhr
      redirect "/question/#{@question.id}"
    end
   else
    #validations failed. show the error to the user
    @errors = @question.errors.full_message
    erb :'questions/new'
   end
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
