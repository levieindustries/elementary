class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_current_user
  before_action :require_login

  helper_method \
  def current_user
    @current_user
  end

  helper_method \
  def logged_in?
    @current_user.present?
  end

  def current_user=(user)
    @current_user = user
  end

  private

  def not_authenticated
    redirect_to login_path
  end

  def require_login
    not_authenticated unless current_user.present?
  end

  def load_current_user
    return unless session[:current_user_id]
    @current_user = User.find(session[:current_user_id])
  end
end
