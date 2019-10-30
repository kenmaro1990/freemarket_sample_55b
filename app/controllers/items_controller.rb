class ItemsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @items = Item.includes(:item_images).order('id DESC').limit(10)
    @ladies_items = Item.includes(:item_images).where(category_id: 1).limit(10).order('id DESC')
    @mens_items = Item.includes(:item_images).where(category_id: 2).limit(10).order('id DESC')
    @electrical_appliances = Item.includes(:item_images).where(category_id: 3).limit(10).order('id DESC')
    @toys = Item.includes(:item_images).where(category_id: 4).limit(10).order('id DESC')
    @chanel = Item.includes(:item_images).where(brand_id: 1).limit(10).order('id DESC')
    @louis_vuitton = Item.includes(:item_images).where(brand_id: 2).limit(10).order('id DESC')
    @supreme = Item.includes(:item_images).where(brand_id: 3).limit(10).order('id DESC')
    @nike = Item.includes(:item_images).where(brand_id: 4).limit(10).order('id DESC')
  end
  
end