class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  def show
    if current_user.nil?
      redirect_to new_session_url
      return
    end

    @user = current_user
    render :show
  end

  def user_params
    self.params.require(:user).permit(:email, :password)
  end
end
