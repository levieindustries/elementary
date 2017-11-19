require "active_interaction"

module Users
  class Create < ActiveInteraction::Base
    string :name
    string :email
    string :password

    def execute
      user = User.create(
        name: name,
        email: email,
        password: password
      )

      return errors.merge!(user.errors) if user.invalid?

      user
    end
  end
end
