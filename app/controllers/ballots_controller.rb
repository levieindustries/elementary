class BallotsController < ApplicationController
  def show
    @categories = Category.all
  end

  def new
  end

  def create
    ballot = current_user.current_ballot!

    if ballot.valid?
      redirect_to ballot_path(ballot)
    else
      flash.alert = "There was a problem creating your ballot."
      render :new
    end
  end
end
