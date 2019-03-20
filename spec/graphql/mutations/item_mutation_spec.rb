RSpec.describe Mutations::ItemMutation do
  describe 'creating a new record' do
    # an item belongs to a tod list so we create one
    let!(:todo_l) { create(:todo_l) }

    it 'adds a new item' do
      args = {
        todo_l_id: todo_l.id,
        name: 'An amazing name',
      }

      subject.fields['create_item'].resolve(nil, args, nil)
      # The items count increases by 1
      expect(Item.count).to eq(1)
      # The name of the most recently created item matches the value we passed in args
      expect(Item.last.name).to eq('An amazing name')
    end
  end
end