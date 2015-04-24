class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      # HAPPY PATH
      session[:user_id] = user.id
      flash[:notice] = 'Login successfully'
      redirect_to root_path
    else
      flash[:error] = 'Your username or password is wrong'
      render 'sessions/new' #In the video is using redirect_to, why?
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You are logged out, goodbye'
    redirect_to root_path
  end

end