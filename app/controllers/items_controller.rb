class ItemsController < ApplicationController
  def new
    @item = Item.new

    @category_array = [
      {id: "", name: "---"},
      {id: 1, name: "レディース"},
      {id: 2, name: "メンズ"},
      {id: 3, name: "ベビー・キッズ"},
      {id: 3, name: "インテリア・住まい・小物"},
      {id: 3, name: "本・音楽・ゲーム"},
      {id: 3, name: "おもちゃ・ホビー・グッズ"},
      {id: 3, name: "コスメ・香水・美容"},
      {id: 3, name: "家電・スマホ・カメラ"},
      {id: 3, name: "スポーツ・レジャー"},
      {id: 3, name: "ハンドメイド"},
      {id: 3, name: "チケット"},
      {id: 3, name: "自動車・オートバイ"},
      {id: 3, name: "その他"}
    ]
    @condition_array = [
      '---',
      '新品、未使用',
      '未使用に近い',
      '目立った傷や汚れなし',
      'やや傷や汚れあり',
      '傷や汚れあり',
      '全体的に状態が悪い'
    ]
    @postage_array = [
      '---',
      '送料込み(出品者負担)',
      '着払い(購入者負担)'
    ]
    @lead_time_array = [
      '---',
      '1~2日で発送',
      '2~3日で発送',
      '4~7日で発送'
    ]
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path
  end

  def index
    @items = Item.includes(:item_images).order('id DESC').limit(10)
    @ladies_items = Item.includes(:item_images).where(category_id: 1).limit(10).order('id DESC')
    @mens_items = Item.includes(:item_images).where(category_id: 205).limit(10).order('id DESC')
    @electrical_appliances = Item.includes(:item_images).where(category_id: 3).limit(10).order('id DESC')
    @toys = Item.includes(:item_images).where(category_id: 493).limit(10).order('id DESC')
    @chanel = Item.includes(:item_images).where(brand_id: 1).limit(10).order('id DESC')
    @louis_vuitton = Item.includes(:item_images).where(brand_id: 3).limit(10).order('id DESC')
    @supreme = Item.includes(:item_images).where(brand_id: 4).limit(10).order('id DESC')
    @nike = Item.includes(:item_images).where(brand_id: 2).limit(10).order('id DESC')
  end

  private

  def item_params
    params.require(:item).permit(
      :name, 
      :description, 
      :category_id, 
      :size,
      :price, 
      :condition, 
      :postage, 
      :departure_area, 
      :lead_time).merge(
        user_id: current_user.id,
        seller_id: current_user.id,
        brand_id: 0,
        shipping_method: "",
        display: "open"
      )
  end

end