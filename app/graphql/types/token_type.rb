ApiKeyType = GraphQL::ObjectType.define do
  name "API key"

  field :token, !types.String
  field :errors, types[types.String] do
    resolve ->(obj, _args, _ctx) { obj.errors.full_messages }
  end
end
