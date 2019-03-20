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

    field :edit_todo_l, Types::TodoLType do
      argument :id, !types.ID, 'the ID of the todolist to edit'
      argument :title, types.String, 'the new title'

      resolve ->(_obj, args, _ctx) do
        todo_l = TodoL.find_by(id: args[:id])

        if args.key?(:title)
          todo_l.update(
            title: args[:title]
          )
        end
        todo_l
      end
    end

    field :delete_todo_l, types[Types::TodoLType] do
      argument :id, !types.ID, 'the ID of the todolist to delete'

      resolve ->(_obj, args, _ctx) do
        todo_ls = TodoL.all
        todo_l = TodoL.find_by(id: args[:id])

        # Ensure that we find the todo list
        todo_l.destroy
        # return all todo lists
        todo_ls
      end
    end
  end
end