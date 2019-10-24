FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.first_name}
    email                 {Faker::Internet.email}
    password              {Faker::String.random}
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    first_name_kana       {"タロウ"}
    last_name_kana        {"サトウ"}
    phone_number          {Faker::PhoneNumber}
    birthyear             {Faker::Number.within(range: 1990..2010)}
    birthmonth            {Faker::Number.within(range: 1..12)}
    birthday              {Faker::Number.within(range: 1..31)}
  end

end