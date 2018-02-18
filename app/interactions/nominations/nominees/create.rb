require "active_interaction"

module Nominations
  module Nominees
    class Create < ActiveInteraction::Base
      integer :nominateable_id
      string :nominateable_type
      integer :nomination_id

      def execute
        nominee = Nominee.create(inputs)
        errors.merge!(nominee.errors) if nominee.invalid?
        nominee
      end
    end
  end
end
