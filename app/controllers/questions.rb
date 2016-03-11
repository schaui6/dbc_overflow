get '/questions' do 
	@user = User.find(session[:user_id])
	@questions = Question.all
	erb :'questions/index'
end