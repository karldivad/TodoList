module Types
  TodoLType = GraphQL::ObjectType.define do
    name 'TodoLType'
    description 'The Todo List type'

    field :id, !types.ID
    field :title, !types.String
    field :items, types[Types::ItemType] do
      resolve ->(obj, _args, _ctx) { obj.items }
    end
  end
end