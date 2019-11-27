class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_items, only: [:edit, :update]
  before_action :set_category, only: [:edit, :update]
  before_action :set_size_array, only: [:edit, :update]
  

  def new
    @item = Item.new
    5.times{@item.item_images.build}
    @brands = Brand.where('name LIKE(?)',"%#{params[:keyword]}%").limit(5)

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def show
  end

  def edit
    @brands = Brand.where('name LIKE(?)',"%#{params[:keyword]}%").limit(5)

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def update
    binding.pry
    @item.update!(item_params)
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
    @ladies_items = Item.includes(:item_images).where(category_id: 3).limit(10).order('id DESC')
    @mens_items = Item.includes(:item_images).where(category_id: 207).limit(10).order('id DESC')
    @electrical_appliances = Item.includes(:item_images).where(category_id: 947).limit(10).order('id DESC')
    @toys = Item.includes(:item_images).where(category_id: 728).limit(10).order('id DESC')
    @chanel = Item.includes(:item_images).where(brand_id: 1).limit(10).order('id DESC')
    @louis_vuitton = Item.includes(:item_images).where(brand_id: 3).limit(10).order('id DESC')
    @supreme = Item.includes(:item_images).where(brand_id: 4).limit(10).order('id DESC')
    @nike = Item.includes(:item_images).where(brand_id: 2).limit(10).order('id DESC')
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}")
    if related_size_parent = selected_grandchild.sizes[0]
       @sizes = related_size_parent.children
    else
       selected_child = Category.find("#{params[:grandchild_id]}").parent
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

  def set_items
    @item = Item.find(params[:id])
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
    @size = Size.find(@item.size_id)
    @size_array = Size.where(ancestry: @size.ancestry)
  end

end