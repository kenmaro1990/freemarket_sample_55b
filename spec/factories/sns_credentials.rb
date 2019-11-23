FactoryBot.define do

  factory :sns_credential do
    uid { "0000000000000000000000" }
    provider { "google_oauth" }
    user
  end
end