class UsersController < ApplicationController
    def index
        # render plain: "I'm in the index action!"
        render json: User.all
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destory
        user = User.find(params[:id])
        user.destory
        render json: user
    end

    private



    def user_params
        params.require(:user).permit(:name, :email)
    end
end
