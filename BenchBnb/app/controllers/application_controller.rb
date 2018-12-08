class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  def login(user)
    session[:session_token] = user.reset_session_token
  end

  def logout
    user.reset_session_token
    sesson[:session_token] = null;
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_loggin!
    redirect_to new_session_url unless logged_in?
  end
end
