class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        @current_user = user
        session[:session_token] = @current_user.session_token
    end

    def already_signed_in
        redirect_to cats_url if current_user
    end

    def require_current_user!
        redirect_to new_session_url unless current_user
    end 

    
end
