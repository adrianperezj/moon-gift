class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def login

  end

  def authenticate
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :login
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
