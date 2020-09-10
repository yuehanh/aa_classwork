class ApplicationController < ActionController::Base
    helper_method :current_user, :require_logged_in

    def current_user
        reuturn nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        session[:session_token] = nil
        current_user.reset_session_token!
        current_user = nil
    end

    def logged_in?
        !!current_user
    end
end
