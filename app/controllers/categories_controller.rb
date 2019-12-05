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
    @category = Category.find(params[:id])
    category_check(@category)
  end

  private
  def category_check(cat)
    anc = cat.ancestry
    match_id = []
    if anc.blank?
      anc_set = "^#{cat.id}/"
      reg = Regexp.new(anc_set)
      not_null_categories = Category.where.not("ancestry IS NULL")
      not_null_categories.each do |c|
        if c[:ancestry].match(reg)
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id).order("id DESC").page(params[:page]).per(50)
    elsif anc.match(/\//)
      @items = Item.where(category_id: cat.id).order("id DESC").page(params[:page]).per(50)
    else
      parent = anc
      child = cat.id
      anc_set = "#{parent}/#{child}"
      Category.all.each do |c|
        if c[:ancestry] == anc_set
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id).order("id DESC").page(params[:page]).per(50)
    end
  end

end
