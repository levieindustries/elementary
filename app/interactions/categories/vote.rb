module Categories
  class Vote < ActiveInteraction::Base
    object :voter, class: User
    object :category
    object :nominee, class: Film

    def execute
      ActiveRecord::Base.transaction do
        ballot.votes.joins(:nomination).where(nominations: { category_id: category }, year: 2017).destroy_all
        ballot.votes.create(year: 2017, nomination: nomination)
      end
    end

    private

    def nomination
      category.nominations.where(nominee_id: nominee, year: 2017).first
    end

    def ballot
      voter.current_ballot!
    end
  end
end
