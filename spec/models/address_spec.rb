require 'rails_helper'

describe Address do
  describe '#create' do

    it "is invalid without a address_first_name" do
      address = build(:address, address_first_name: "")
      address.valid?
      expect(address.errors[:address_first_name]).to include("を入力してください")
    end

    it "is invalid without a address_last_name" do
      address = build(:address, address_last_name: "")
      address.valid?
      expect(address.errors[:address_last_name]).to include("を入力してください")
    end

    it "is invalid without a address_first_name_kana" do
      address = build(:address, address_first_name_kana: "")
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a address_first_name_kana" do
      address = build(:address, address_first_name_kana: "")
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("を入力してください")
    end

  end
end