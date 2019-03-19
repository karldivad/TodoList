FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item name #{n}"}
    done false
    todo_l
  end
end