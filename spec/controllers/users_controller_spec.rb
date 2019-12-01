require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:item) { create(:item) }


  describe 'GET #index' do
    context "ログインしていない場合" do
      it "renders the :root_path" do
        get :index
        expect(response).to redirect_to root_path
      end
    end
    context "ログインしている場合" do
      before do
        sign_in user
      end
      it "renders the :index" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #selling' do
    context "ログインしていない場合" do
      it "renders the :root_path" do
        get :selling
        expect(response).to redirect_to root_path
      end
    end
    context "ログインしている場合" do
      before do
        sign_in user
      end
      it "renders the :selling template" do
        get :selling
        expect(response).to render_template :selling
      end
    end
  end

  describe 'GET #in_progress' do
    context "ログインしていない場合" do
      it "renders the :root_path" do
        get :in_progress
        expect(response).to redirect_to root_path
      end
    end
    context "ログインしている場合" do
      before do
        sign_in user
      end
      it "renders the :in_progress template" do
        get :in_progress
        expect(response).to render_template :in_progress
      end
    end
  end

  describe 'GET #completed' do
    context "ログインしていない場合" do
      it "renders the :root_path" do
        get :completed
        expect(response).to redirect_to root_path
      end
    end
    context "ログインしている場合" do
      before do
        sign_in user
      end
      it "renders the :completed template" do
        get :completed
        expect(response).to render_template :completed
      end
    end
  end

  describe 'GET #purchase' do
    context "ログインしていない場合" do
      it "renders the :root_path" do
        get :purchase
        expect(response).to redirect_to root_path
      end
    end
    context "ログインしている場合" do
      before do
        sign_in user
      end
      it "renders the :purchase template" do
        get :purchase
        expect(response).to render_template :purchase
      end
    end
  end

  describe 'GET #purchased' do
  context "ログインしていない場合" do
    it "renders the :root_path" do
      get :purchased
      expect(response).to redirect_to root_path
    end
  end
  context "ログインしている場合" do
    before do
      sign_in user
    end
    it "renders the :purchased template" do
      get :purchased
      expect(response).to render_template :purchased
    end
  end
end
end