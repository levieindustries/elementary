require "active_interaction"

module Users
  class Authenticate < ActiveInteraction::Base
    object :user
    string :password_attempt

    def execute
      if user.password != password_attempt
        return errors.add(:description, "Invalid login")
      end

      api_key = compose(::ApiKeys::FindOrCreate, keyable: user)

      return errors.merge!(api_key.errors) if api_key.invalid?

      api_key.token
    end
  end
end
