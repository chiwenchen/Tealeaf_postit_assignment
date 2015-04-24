class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   helper_method :current_user, :logged_in?, :voted? #定義哪些method可以同時當作helper_method給view使用

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def voted?(post)
    if logged_in?
      all_voter = post.votes.map{|vote| vote.user_id }
      all_voter.include?(current_user.id)
    else 
      true #not logged_in
    end
  end

  def require_user
    if !logged_in?
      flash[:error] = 'You must login to do this'
      redirect_to login_path
    end
  end

end
