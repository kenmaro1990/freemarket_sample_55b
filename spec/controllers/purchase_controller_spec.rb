require 'rails_helper'

describe PurchaseController do
  describe 'GET #pay' do
  
    it "renders the :index template" do
      expect(response).to redirect_to root_path
    end
    
  end
end