class UsersController < ApplicationController
  before_action :logged_in?, only: [:show, :index]

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
    @user = current_user
    render :show
  end

  def user_params
    self.params.require(:user).permit(:email, :password)
  end
end
