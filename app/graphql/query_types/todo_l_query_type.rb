module QueryTypes
  TodoLQueryType = GraphQL::ObjectType.define do
    name 'TodoLQueryType'
    description 'The todo list query type'

    field :todo_ls, types[Types::TodoLType], 'returns all todo ls' do
      resolve ->(_obj, _args, _ctx) { TodoL.all }
    end
  end
end