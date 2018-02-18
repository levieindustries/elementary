require "active_interaction"

module Nominations
  class Create < ActiveInteraction::Base
    import_filters Nominees::Create

    integer :category_id
    integer :year

    def execute
      Nomination.transaction do
        nomination = Nomination.create(
          year: year,
          category_id: category_id,
          nominee: create_nominee
        )

        errors.merge!(nomination.errors) if nomination.invalid?

        nomination
      end
    end

    private

    def create_nominee
      compose(Nominees::Create, inputs)
    end
  end
end
