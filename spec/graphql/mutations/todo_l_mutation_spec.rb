RSpec.describe Mutations::TodoLMutation do
  describe 'creating a new record' do
    let(:args) do
      {
        title: 'Some random title'
      }
    end

    it 'increases todo lists by 1' do
      mutation = subject.fields['create_todo_l'].resolve(nil, args, nil)
      # adds one todo_list to the db
      expect(mutation).to change { TodoL.count }.by 1
    end
  end
end