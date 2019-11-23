require 'rails_helper'

describe SnsCredential do
  describe '#create' do
    it "is valid with a uid, provider, user_id" do
      sns = build(:sns_credential)
      expect(sns).to be_valid
    end
  end
end