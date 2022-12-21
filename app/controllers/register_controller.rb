class RegisterController < ApplicationController
    def new
        @user = User.new
    end

    def create
        case params[:user_type]
            when 'admin'
            user_type = 0
            when 'seller'
            user_type = 1
            when 'buyer'
            user_type = 2
            end
        @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], user_type: user_type)
        
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
