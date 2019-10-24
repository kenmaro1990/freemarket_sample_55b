FactoryBot.define do

  factory :address do
    user_id {Faker::Number.number(digits: 2)}
    address_first_name {Faker::Name.first_name}
    address_last_name {Faker::Name.last_name}
    address_first_name_kana {"タロウ"}
    address_last_name_kana {"サトウ"}
    postal_code {Faker::Address.postcode}
    prefecture_id {Faker::Number.within(range: 1..47)}
    city {Faker::Address.city}
    block {Faker::Address.street_name}
    building {Faker::Address.secondary_address}
    address_phone_number {Faker::PhoneNumber}
  end

end