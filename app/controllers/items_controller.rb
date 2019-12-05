class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_items, only: [:edit, :update]
  before_action :set_category, only: [:edit, :update]
  before_action :set_size_array, only: [:edit, :update]
  

  def new
    @item = Item.new
    5.times{@item.item_images.build}
    @brands = Brand.where('name LIKE(?)',"%#{params[:keyword]}%").limit(5)

    @category_parent_array = Category.where(ancestry: nil)

  end

  def show
    @item = Item.find(params[:id])
    @images = @item.item_images
    @image = @images.first
  end

  def edit
    @brands = Brand.where('name LIKE(?)',"%#{params[:keyword]}%").limit(5)
  end

  def update
    if @item.update(item_update_params)
      redirect_to root_path
    else
      flash[:error] = @item.errors.keys.map { |key|[key, @item.errors.full_messages_for(key)]}.to_h
      redirect_to edit_item_path
    end
  end

  def create
    @item = Item.new(item_params)    
    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      flash[:error] = @item.errors.keys.map { |key|[key, @item.errors.full_messages_for(key)]}.to_h
      redirect_to new_item_path
    end
  end

  def index
    @items = Item.includes(:item_images).order('id DESC').limit(10)
    @ladies_items = Item.includes(:item_images).where(category_id: 1..186).limit(10).order('id DESC')
    @mens_items = Item.includes(:item_images).where(category_id: 188..332).limit(10).order('id DESC')
    @electrical_appliances = Item.includes(:item_images).where(category_id: 889..974).limit(10).order('id DESC')
    @toys = Item.includes(:item_images).where(category_id: 670..782).limit(10).order('id DESC')
    @chanel = Item.includes(:item_images).where(brand_id: 1).limit(10).order('id DESC')
    @louis_vuitton = Item.includes(:item_images).where(brand_id: 3).limit(10).order('id DESC')
    @supreme = Item.includes(:item_images).where(brand_id: 4).limit(10).order('id DESC')
    @nike = Item.includes(:item_images).where(brand_id: 2).limit(10).order('id DESC')
  end

  def destroy 
    @item = Item.find(params[:id])
    @item.destroy 
    if @item.seller_id == current_user.id
      redirect_to root_path
      flash[:alert] = '商品を削除しました'
    else
      redirect_to item_path(@item)
      flash[:alert] = '商品削除に失敗しました'
    end
  end

  def purchase
    @item = Item.find(params[:id])
    @images = @item.item_images
    @image = @images.first  
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id], ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def get_size
    selected_grandchild = Category.find(params[:grandchild_id])
    if related_size_parent = selected_grandchild.sizes[0]
      @sizes = related_size_parent.children
    else
      selected_child = Category.find(params[:grandchild_id]).parent
      if related_size_parent = selected_child.sizes[0]
        @sizes = related_size_parent.children 
      end
    end
  end

  def search_brand
    @brands = Brand.where('name LIKE(?)',"%#{params[:keyword]}%").limit(5)
  end

  def get_image
  end

  def delete_image
    @ids = params[:id]
    @ids.each do |id|
      ItemImage.find(id).delete
    end
  end


  private

  def item_params
    params.require(:item).permit(
      :name, 
      :description, 
      :size_id,
      :price, 
      :condition, 
      :postage, 
      :departure_area, 
      :lead_time,
      :category_id,
      :brand_name,
      :brand_id,
      :shipping_method,
      item_images_attributes: [:image]
    ).merge(
      user_id: current_user.id,
      seller_id: current_user.id,
      display: "open"
    )
  end

  def item_update_params
    params.require(:item).permit(
      :name, 
      :description, 
      :size_id,
      :price, 
      :condition, 
      :postage, 
      :departure_area, 
      :lead_time,
      :category_id,
      :brand_name,
      :brand_id,
      :shipping_method,
      item_images_attributes: [:id, :image]
    ).merge(
      user_id: current_user.id,
      seller_id: current_user.id,
      display: "open"
    )
  end
  
  def delete_item_params
    params.require()
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def save_image
    @images_id = params.require(:item).permit(item_images_attributes: [:id])
    @images_id.each do |id|
      @image = ItemImage.find(id)
      @image.create
    end
  end

  def set_category
    @grand_children = Category.find(@item.category_id)
    @grand_children_array = Category.where(ancestry: @grand_children.ancestry)
    @children = @grand_children.parent
    @children_array = Category.where(ancestry: @children.ancestry)
    @parent = @children.parent
    @parent_array = Category.where(ancestry: @parent.ancestry)
  end

  def set_size_array
    if @item.size_id != nil
      @size = Size.find(@item.size_id)
      @size_array = Size.where(ancestry: @size.ancestry)
    end
  end

end