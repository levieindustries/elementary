require "active_interaction"

module ApiKeys
  class Create < ActiveInteraction::Base
    object :keyable

    def execute
      api_key = ApiKey.create(keyable: keyable)
      return errors.merge!(api_key.errors) if api_key.invalid?
      api_key
    end
  end
end
