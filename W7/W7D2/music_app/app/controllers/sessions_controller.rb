class SessionsController < ApplicationController
    before_action :require_no_user!, only: %i[new create]
    
    def new
        # render :new implicit
    end

    def create
        user = User.find_by_credentials( # learn more about params, why we have nested Hashes
            params[:user][:email],
            params[:user][:password]
        ) # f_b_c will either be nil or <User>
        if user
            login!(user)
            redirect_to :bands # does 'user_url' require user.id?
            # check with routes
        else
            flash.now[:errors] = ['Wrong Password and Username']
            render :new # don't want to redirect, b/c new will 'POST' again anyways
        end
    end

    def destroy
        logout!
        redirect_to new_session_url # why redirect not render: ?
    end
end
