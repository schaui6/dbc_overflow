class UsersController < ApplicationController

  def show
    if session[:id]
      # All user's questions
      @user = User.find_by(id: params[:id])
      @questions = Question.where(poster_id: @user.id)

      # All questions from answers the user's responded to
      questions_id = User.find(@user.id).answers.pluck('DISTINCT question_id')
      @questions_from_answer = Question.find(questions_id)
      render users_path
    else
      render welcome_index_path
    end
  end

  def create
    @user = User.new(email: params[:email], username: params[:username], password: params[:password])
    
    if @user.save
      session[:id] = @user.id
      redirect_to '/questions'
      # redirect_to "/users/#{@user.id}"
    elsif @user.id == nil
      redirect_to "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
    end
  end


   def new
     User.new
   end
   
   def destroy
     session[:id] = nil
     redirect welcome_index_path
   end

   private


   def user_params
     params.require(:user).permit(:email, :username, :password)
   end

end




