FactoryBot.define do

  factory :item_image do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    item_id {1}
    association :item
  end

  
end