class UsersController < ApplicationController
    before_action :already_signed_in, except: [:create, :new]
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.password_c == @user.password && @user.save
      login!(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password, :password_c)
  end
end
