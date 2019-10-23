FactoryBot.define do

  factory :user do
    nickname              {"つくね"}
    email                 {"tsukune@gmail.com"}
    password              {"00000000"}
    first_name            {"太郎"}
    last_name             {"佐藤"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"サトウ"}
    phone_number          {"09012345678"}
    birthyear             {"1990"}
    birthmonth            {"11"}
    birthday              {"11"}
  end

end