class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new,:create,:show]

  def new
    @user = User.new
  end

  def index
    if current_user
      @user = User.find(session[:user_id])
      @ip = request.remote_ip

    else
      redirect_to login_path
    end
  end

  def show
    if current_user
      @user = User.find(session[:user_id])

    else
      redirect_to login_path
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome to Login Test"
      redirect_to @user
    else
      render new_user_path
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
