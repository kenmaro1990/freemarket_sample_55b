class Address < ApplicationRecord
  class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  end

  belongs_to :user, optional: true
end
