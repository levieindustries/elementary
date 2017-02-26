class BallotsController < ApplicationController
  def show
    @categories = Category.all
  end

  def new
  end

  def create
    ballot = current_user.ballots.where(year: 2017).first_or_create

    if ballot.valid?
      redirect_to ballot_path(ballot)
    else
      flash.alert = "There was a problem creating your ballot."
      render :new
    end
  end
end
