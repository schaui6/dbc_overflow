get '/' do
	@user = User.find(session[:user_id])
	@questions = Question.order(created_at: :desc)
  erb :index
end

get '/login' do 
	erb :login
end

post '/login' do 
	@user = User.find_by(email: params[:email])
	if @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect '/questions'
		# redirect "/users/#{@user.id}"
	elsif @user.id == nil
		redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
	end
end

delete '/logout' do 
	session[:user_id] = nil
	redirect '/login'
end