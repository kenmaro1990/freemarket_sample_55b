require 'rails_helper'

describe SnsCredential do
  describe '#create' do
    it "is valid with a uid, provider, user_id" do
      sns = build(:sns_credential)
      expect(sns).to be_valid
    end

    # it "is invalid without a uid" do
    #   sns = build(:sns_credential, uid: "")
    #   sns.valid?
    #   expect(sns.errors[:uid]).to include("アカウントを登録してください")
    # end

    # it "is invalid without a uid" do
    #   sns = build(:sns_credential, provider: "")
    #   sns.valid?
    #   expect(sns.errors[:provider]).to include("アカウントを登録してください")
    # end
  end
end