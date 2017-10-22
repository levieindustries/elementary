class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    if @user = login(user_params[:email], user_params[:password])
      redirect_back_or_to(new_ballot_path, notice: 'Login successful')
    else
      @user = User.new(user_params.slice(:email))

      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_url, notice: 'Logged out!')
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
