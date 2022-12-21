class RegisterController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.password == @user.password_confirmation
            if @user.valid?
            # Handle successful user creation
                @user.save
                redirect_to '/login'
            else
                render 'new'
            end
        else
            flash.now[:alert] = "Password confirmation doesn't match Password"
            render 'new'
        end
    end

    


  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :user_type)
  end
end
