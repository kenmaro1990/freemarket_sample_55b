FactoryBot.define do

  factory :item do
    name            {"pen"}
    description     {"ペンです"}
    price           {Faker::Number.within(range: 300..10000)}
    seller_id       {Faker::Number.within(range: 1..10)}
    buyer_id        {Faker::Number.within(range: 1..10)}
    category_id     {8}
    brand_id        {Faker::Number.within(range: 1..10)}
    condition       {"新品、未使用"}
    postage         {"送料込み（出品者負担）"}
    shipping_method {"らくらくメリカリ便"}
    departure_area  {"東京都"}
    lead_time       {"1~2日で発送"}
    display         {"open"}
    user
  end
  
end