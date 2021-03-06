class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private

    def current_user
        return nil unless session[:session_token]

        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_login
        redirect_to :new_session unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        current_user = nil
        session[:session_token] = nil
    end
end
