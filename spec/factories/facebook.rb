FactoryBot.define do
  factory :facebook do
    email                 {Faker::Internet.email}
    password              {Faker::String.random}
  end
end