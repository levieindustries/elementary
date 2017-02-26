class SessionsController < ApplicationController
  skip_before_action :require_login
  before_action :require_empty_session, except: [:destroy]

  def new
    @user = User.where(id: session[:current_user_id]).first_or_initialize
  end

  def create
    @user = User.where(name: user_params[:name]).first_or_create

    if @user.valid?
      session[:current_user_id] = @user.id
      redirect_to new_ballot_path
    else
      flash[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    current_user = nil
    reset_session
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def require_empty_session
    redirect_to new_ballot_path if current_user.present?
  end
end
