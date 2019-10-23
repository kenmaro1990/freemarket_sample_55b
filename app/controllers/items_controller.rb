class ItemsController < ApplicationController
  def new
  end

  def index
    @items = Item.includes(:item_images).order('id ASC').limit(10)
    @ladies_items = Item.includes(:item_images).where(category_id: 1).limit(10).order('id ASC')
    @mens_items = Item.includes(:item_images).where(category_id: 2).limit(10).order('id ASC')
    @electrical_appliances = Item.includes(:item_images).where(category_id: 3).limit(10).order('id ASC')
    @toys = Item.includes(:item_images).where(category_id: 4).limit(10).order('id ASC')
    @chanel = Item.includes(:item_images).where(brand_id: 1).limit(10).order('id ASC')
    @louis_vuitton = Item.includes(:item_images).where(brand_id: 2).limit(10).order('id ASC')
    @supreme = Item.includes(:item_images).where(brand_id: 3).limit(10).order('id ASC')
    @nike = Item.includes(:item_images).where(brand_id: 4).limit(10).order('id ASC')
  end
  
end