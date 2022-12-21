class ApplicationController < ActionController::Base
    

    def is_logined
        if session[:logged_in] == true
            return true
        else
            redirect_to '/login', notice: "You must login"
        end
    end

    def role
        @myrole = User.find(session[:user_id]).user_type
        if (@myrole == 0)
            @myrole = 'admin'
        elsif (@myrole == 1)
            @myrole = 'seller'
        else
            @myrole = 'buyer'
        end
    end

end
