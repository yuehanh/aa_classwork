class SessionsController < ApplicationController
    before_action :require_no_user!, only: [:new, :create]

    def new
        render :new
    end

    def create
        user = User.find_by_credentials( # learn more about params, why we have nested Hashes
            params[:user][:email],
            params[:user][:password]
        ) # f_b_c will either be nil or <User>
        if user
            login!(user)
            redirect_to user_url(user.id) # does 'user_url' require user.id?
            # check with routes
        else
            flash.now[:errors] = ["You suck\n"]
            render :new # don't want to redirect, b/c new will 'POST' again anyways
        end
    end

    def destroy
        logout!
        redirect_to new_session_url # why redirect not render: ?
    end
end
