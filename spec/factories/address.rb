FactoryBot.define do

  factory :address do
    user_id {1}
    address_first_name {"太郎"}
    address_last_name {"佐藤"}
    address_first_name_kana {"タロウ"}
    address_last_name_kana {"サトウ"}
    postal_code {"0200011"}
    prefecture_id {1}
    city {"八王子市"}
    block {"長沼地"}
    building {"ヒルサイドテラス"}
    address_phone_number {"09012345678"}
  end

end