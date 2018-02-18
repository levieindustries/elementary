Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :auth, field: Mutations::Auth.field
end
