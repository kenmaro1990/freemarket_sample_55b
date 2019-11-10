require 'rails_helper'

describe PurchaseController do
  describe 'GET #show' do
    it "renders the :show template" do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #pay' do
    it "renders the user_path" do
      expect(response).to have_http_status(:success)
    end
  end
end