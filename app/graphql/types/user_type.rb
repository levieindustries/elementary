Types::UserType = GraphQL::ObjectType.define do
  name "User"

  field :id, !types.ID
  field :ballots, types[!Types::BallotType]
  field :name, !types.String
  field :email, !types.String
  field :created_at, !types.String
  field :updated_at, !types.String
end
