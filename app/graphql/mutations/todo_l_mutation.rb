module Mutations
  TodoLMutation = GraphQL::ObjectType.define do
    name 'TodoLMutation'
    description 'Mutation type for todo list'

    field :create_todo_l, Types::TodoLType do
      argument :title, !types.String

      resolve ->(_obj, args, _ctx) do
        TodoL.create(
          title: args[:title]
        )
      end
    end
  end
end