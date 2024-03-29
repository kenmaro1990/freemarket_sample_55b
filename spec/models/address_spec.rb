require 'rails_helper'

describe Address do
  describe '#create' do

    it "is invalid without a address_first_name" do
      address = build(:address, address_first_name: "")
      address.valid?
      expect(address.errors[:address_first_name]).to include("を入力してください")
    end

    it "is invalid without address_last_name" do
      address = build(:address, address_last_name: "")
      address.valid?
      expect(address.errors[:address_last_name]).to include("を入力してください")
    end

    it "is invalid without a address_first_name_kana" do
      address = build(:address, address_first_name_kana: "")
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a address_last_name_kana" do
      address = build(:address, address_last_name_kana: "")
      address.valid?
      expect(address.errors[:address_last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a postal code " do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a block" do
      address = build(:address, block: "")
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end
  end
end