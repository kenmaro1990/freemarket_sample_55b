class BrandsController < ApplicationController
  def index
    @persons = Brand.all.order("id ASC").limit(6)
  end

  def show
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id: params[:id]).order("id DESC").page(params[:page]).per(50)
  end
end
