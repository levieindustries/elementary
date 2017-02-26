class BallotsController < ApplicationController
  def show
    @categories = Category.all
    @ballot = current_user.current_ballot!
  end

  def new
  end

  def create
    ballot = current_user.current_ballot!

    if ballot.valid?
      redirect_to ballot_path
    else
      flash.alert = "There was a problem creating your ballot."
      render :new
    end
  end
end
