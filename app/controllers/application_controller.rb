class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   helper_method :current_user, :logged_in?, :can_vote?, :admin? #定義哪些method可以同時當作helper_method給view使用

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def can_vote?(post)
    if logged_in?
      all_voter = post.votes.map{|vote| vote.user_id }
      !all_voter.include?(current_user.id)
    else 
      false #not logged_in
    end
  end

  def require_user
   access_denied if !logged_in?
  end

  def admin?
    true if current_user.username == 'admin'
  end

  def access_denied
    flash[:error] = 'You can not do this'
    redirect_to root_path
  end

end
