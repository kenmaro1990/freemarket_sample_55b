require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
  
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #new' do
    # it "assigns the requested tweet to @item" do
    #   item = build(:item, user_id: 1, category_id: 2, size_id: 3)
    #   get :new
    #   expect(assigns(:item)).to eq item
    # end
  
    # it "renders the :new template" do
    #   get :new
    #   expect(response).to render_template :new
    # end
  end

  describe 'POST #create' do
    # 商品の保存は成功か
    context "can save" do
      before do
        @item = build(:item, user_id: 1, category_id: 2, size_id: 3)
        @item_params = @item.attributes.tap do |ip|
          ip["category_id"] = ip["category_id"].to_s
          ip["size_id"] = ip["size_id"].to_s
        end
      end

    #   it 'new item' do
    #     expect{item :create, params: {item: @item_params}}.to change(Item, :count).by(1)
    #   end

    #   it "redirects to root_path" do
    #     item :create
    #     expect(response).to redirect_to(root_path)
    #   end
    # end
    end
  end

end