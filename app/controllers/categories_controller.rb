class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil).order("id ASC").limit(13)
  end

  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @categories = Category.find(params[:id])
  end
  
end
