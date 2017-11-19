require "active_interaction"

module Users
  class Authenticate < ActiveInteraction::Base
    object :user
    string :password

    def execute
      return unless user.password == password
    end
  end
end
