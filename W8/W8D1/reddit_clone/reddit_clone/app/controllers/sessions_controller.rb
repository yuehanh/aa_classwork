class SessionsController < ApplicationController
    before_action :require_login, only: :destroy
    def new; end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login(@user)
            redirect_to :users
        else
            flash[:errors] = ['Invalid Credentials']
            render :new
        end
    end

    def destroy
        logout!
        redirect_to :new_session
    end
end
