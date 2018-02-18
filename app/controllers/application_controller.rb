class ApplicationController < ActionController::Base
  attr_reader :current_user

  protect_from_forgery with: :exception
  before_action :require_login

  private

  def require_login
    not_authenticated unless @current_user
  end

  def not_authenticated
    render json: {}, status: 403
  end
end
