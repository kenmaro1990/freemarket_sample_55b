class ItemsController < ApplicationController
  def new
  end

  def index
    @items = Item.includes(:item_images).order('id ASC').limit(10)
  end

end
