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
   if @question.save? #validation succeeded
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

get '/questions/:id' do
  @question = Question.find(params[:id])
  @q_comments = @question.comments
  # binding.pry
  @answers = @question.answers
  # Look in app/views/index.erb
  erb :'/questions/show'
end