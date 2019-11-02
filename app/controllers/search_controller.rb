class SearchController < ApplicationController
  def search
    @keyword = params[:keyword]
  end
end
