class UsersController < ApplicationController
    before_action :require_no_user!

    def new
        # if you want partial, @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
        # add in a confirm pword?
    end
end
