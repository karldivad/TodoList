module Types
  TodoLType = GraphQL::ObjectType.define do
    name 'TodoLType'
    description 'The Todo List type'

    field :id, !types.ID
    field :title, !types.String
  end
end