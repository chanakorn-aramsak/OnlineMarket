class LoginController < ApplicationController
  
  def index
  end

  def create
    @user = User.find_by!(email: params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:logged_in] = true
      session[:user_id] = @user.id
      redirect_to '/main' 
    else 
      message = "Something went wrong! Make sure your email and password are correct"
      redirect_to '/login', notice: message
    end
  end

  def destroy
    reset_session
    redirect_to '/main'
  end

  
end
