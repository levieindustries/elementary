Types::BallotType = GraphQL::ObjectType.define do
  name "Ballot"

  field :id, !types.ID
  field :user, !types[Types::UserType]
  field :year, !types.Int
  field :created_at, !types.String
  field :updated_at, !types.String
end
