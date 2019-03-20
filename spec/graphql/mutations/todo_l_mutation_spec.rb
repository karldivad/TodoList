RSpec.describe Mutations::TodoLMutation do
  describe 'creating a new record' do
    let(:args) do
      {
        title: 'Some kkk title'
      }
    end

    it 'increases todo lists by 1' do
      mutation = subject.fields['create_todo_l'].resolve(nil, args, nil)
      # adds one todo_list to the db
      expect(mutation).to change { TodoL.count }.by(1)
    end
  end

  describe 'editing a todo list' do
    let!(:todo_l) { create(:todo_l, title: 'Old title') }

    it 'updates a todo list' do
      args = {
        id: todo_l.id,
        title: 'I am a new todo_list title'
      }
      
      query_result = Mutations::TodoLMutation.fields['edit_todo_l'].resolve(nil, args, nil)

      expect(query_result.title).to eq(args[:title])
      # test that the number of todo lists doesn't change
      expect(TodoL.count).to eq 1
    end
  end

  describe 'deleting a todo list' do
    let!(:todo_l1) { create(:todo_l) }
    let!(:todo_l2) { create(:todo_l) }

    it 'deletes a todo list' do
      args = {
        id: todo_l1.id
      }
      query = subject.fields['delete_todo_l'].resolve(nil, args, nil)

      expect(query).not_to include(todo_l1)
    end

    it 'reduces the number of todo lists by one' do
      args = {
        id: todo_l1.id
      }
      subject.fields['delete_todo_l'].resolve(nil, args, nil)

      expect(TodoL.count).to eq 1
    end
  end
end