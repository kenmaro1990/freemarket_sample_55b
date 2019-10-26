class BrandsController < ApplicationController
  def index
    @persons = Brand.all.order("id ASC").limit(6)
  end
end
