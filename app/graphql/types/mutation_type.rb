Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :auth, types.String do
    description "Authenticate a user and get an API Token back"

    argument :email, !types.String
    argument :password, !types.String

    resolve ->(_obj, args, _ctx) {
      user = User.find_by_email(args["email"])
      outcome = Users::Authenticate.run(user: user, password_attempt: args["password"])
      outcome.result
    }
  end
end
