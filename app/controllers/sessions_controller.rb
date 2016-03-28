class SessionsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    p @user
    p '22222' * 200
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect_to '/questions'
        # redirect_to "/users/#{@user.id}"
      elsif @user.id == nil
        redirect_to "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
      end
  end


  def destroy
    session[:id] = nil
    redirect_to root_path
  end

end  

