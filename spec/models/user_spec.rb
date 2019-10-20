require 'rails_helper'

describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birthyear" do
      user = build(:user, birthyear: "")
      user.valid?
      expect(user.errors[:birthyear]).to include("を入力してください")
    end

    it "is invalid without a birthmonth" do
      user = build(:user, birthmonth: "")
      user.valid?
      expect(user.errors[:birthmonth]).to include("を入力してください")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "is invalid without a phone_number" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

  end
end