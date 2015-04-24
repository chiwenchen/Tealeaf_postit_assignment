class UsersController < ApplicationController

  before_action :require_same_user, only: [:edit, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Successfully registered'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(params[:id])

    if @user.update(strong_params)
      flash[:notice] = 'You have successfully update'
      redirect_to user_path(@user)
    else
      render 'users/edit'
    end

  end

  def require_same_user
    if current_user.id != params[:id].to_i
      flash[:error] = 'You can not edit this profile' 
      redirect_to user_path(current_user)
    end
  end

  private

  def strong_params
    params.require(:user).permit(:username, :password, :phone_number, :email)
  end

end