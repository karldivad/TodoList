
FactoryBot.define do
    factory :todo_l do
        sequence(:title) { |n| "#{Faker::Lorem.word}-#{n}"}
    end
end