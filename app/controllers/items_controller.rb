class ItemsController < ApplicationController
  def new
  end

  def index
    @items = Item.order('id ASC').limit(10)
  end

end
