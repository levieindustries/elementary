class VotesController < ApplicationController
  before_action :load_category
  before_action :load_nominee

  def create
    outcome = Categories::Vote.run!(
      voter: current_user,
      category: @category,
      nominee: @nominee
    )

    if outcome.valid?
      head status: :created
    else
      render json: { errors: errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:category_id, :nominee_id)
  end

  def load_category
    @category = Category.find(vote_params[:category_id])
  end

  def load_nominee
    @nominee = @category.nominees.find(vote_params[:nominee_id])
  end
end
