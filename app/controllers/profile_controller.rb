class ProfileController < ApplicationController
  before_action :is_logined
  def index
    @myUser = User.find(session[:user_id])

    @user_id = session[:user_id]
    @email = @myUser.email
    @name = @myUser.name
    @user_type = @myUser.user_type
  end

  def changePassword
    @myUser = User.find(session[:user_id])
    @updating = @myUser.update(password: params[:password], lock_version: @myUser.lock_version)
    if (@updating)
      reset_session
      redirect_to '/login', notice: "Change password successfully. continue to login"
    else

    end
  end
end
