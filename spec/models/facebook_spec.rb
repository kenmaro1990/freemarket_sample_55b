require 'rails_helper'

describe Facebook do
  describe '#create' do

    it "is invalid without a email" do
      facebook = build(:facebook, email: "")
      facebook.valid?
      expect(facebook.errors[:email]).to include("を入力してください")
    end

    it "is invalid without password" do
      facebook = build(:facebook, password: "")
      facebook.valid?
      expect(facebook.errors[:password]).to include("を入力してください")
    end
  end
end