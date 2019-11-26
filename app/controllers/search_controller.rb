class SearchController < ApplicationController
  def search
    @keyword = params[:keyword]
    @items = Item.where('name LIKE(?) OR description LIKE(?)', "%#{@keyword}%", "%#{@keyword}%")
  end
end
