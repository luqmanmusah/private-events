class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account created successfully"
      redirect_to @user
    else
      render :new
      flash[:alert] = "Create your account"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
