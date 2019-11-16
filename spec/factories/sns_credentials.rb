FactoryBot.define do
  factory :sns_credential do
    uid { "MyString" }
    provider { "MyString" }
    user_id {Faker::Number.number(digits: 2)}
  end
end