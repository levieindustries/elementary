class CategoriesController < ApplicationController
  before_action :load_category
  before_action :load_vote

  def index
  end

  private

  def load_category
    @category = Category.find(params[:id])
  end

  def load_vote
    @vote = @category.votes.where(nominations: { year: 2017 }, user_id: current_user.id).first_or_initialize
  end
end
