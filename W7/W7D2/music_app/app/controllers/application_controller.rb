class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? # learn about helper later...
    #CRLLL
    private
    def current_user
        return nil unless session[:session_token]

        @current_user ||= User.find_by(session_token: session[:session_token]
        )
    end

    def require_no_user!  # maybe need to not make this private
        redirect_to user_url(current_user.id) if current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end
    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
    end
    def logged_in?
        !!current_user # current_user method will be either nil or <User> (<User> when it has a s_t--> logged_in)
    end
end
