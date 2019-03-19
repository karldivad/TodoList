require 'rails_helper'

RSpec.describe TodoL, type: :model do
  it 'has a valid factory' do
    # Check that the factory we created is valid
    expect(build(:todo_l)).to be_valid
  end

  let(:attributes) do
    {
      title: 'A test title'
    }
  end

  let(:todo_l) { create(:todo_l, **attributes) }

  describe 'model validations' do
    # check that the title field received the right values
    it { expect(todo_l).to allow_value(attributes[:title]).for(:title) }
    # ensure that the title field is never empty
    it { expect(todo_l).to validate_presence_of(:title) }
    # ensure that the title is unique for each todo list
    it { expect(todo_l).to validate_uniqueness_of(:title)}
  end

  describe 'model associations' do
    # ensure a todo list has many items
    it { expect(todo_l).to have_many(:items) }
  end
end