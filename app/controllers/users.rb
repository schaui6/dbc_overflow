get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	@user = User.create(username: params[:username], 
		email: params[:email], password: params[:password])
	if @user.valid?
		redirect '/questions'
		# redirect "/users/#{@user.id}"
	else
    	redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
	end
end