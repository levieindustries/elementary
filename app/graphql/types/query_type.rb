Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user do
    type Types::UserType
    description "Find a user by ID"
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { User.find(args["id"]) }
  end

  field :users do
    type types[Types::UserType]
    description "Find all users"
    argument :ids, !types[types.ID]
    resolve ->(_obj, _args, _ctx) { User.find(ids) }
  end

  field :ballot do
    type Types::BallotType
    description "Find a ballot by ID"
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Ballot.find(args["id"]) }
  end
end
