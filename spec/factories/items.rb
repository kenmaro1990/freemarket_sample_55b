FactoryBot.define do

  factory :item do
    id              {Faker::Number.within(range: 0..10)}
    name            {"pen"}
    description     {"ペンです"}
    price           {Faker::Number.within(range: 0..10000)}
    seller_id       {Faker::Number.within(range: 1..10)}
    buyer_id        {Faker::Number.within(range: 1..10)}
    category_id     {Faker::Number.within(range: 1..10)}
    brand_id        {Faker::Number.within(range: 1..10)}
    display         {"open"}
    user
  end
  
end