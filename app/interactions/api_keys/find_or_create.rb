require "active_interaction"

module ApiKeys
  class FindOrCreate < ActiveInteraction::Base
    object :keyable

    def execute
      keyable.api_keys.active.first.presence || create_key
    end

    private

    def create_key
      compose(APIKeys::Create, keyable: keyable)
    end
  end
end
