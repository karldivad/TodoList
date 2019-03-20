module QueryTypes
  TodoLQueryType = GraphQL::ObjectType.define do
    name 'TodoLQueryType'
    description 'The todo list query type'

    field :todo_ls, types[Types::TodoLType], 'returns all todo lists' do
      resolve ->(_obj, _args, _ctx) { TodoL.all }
    end

    field :todo_l, Types::TodoLType, 'returns the queried todo list' do
      argument :id, !types.ID
      resolve ->(_obj, args, _ctx) { TodoL.find_by!(id: args[:id]) }
    end
  end
end