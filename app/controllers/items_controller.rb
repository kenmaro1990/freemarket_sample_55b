class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.item_images.build
    @brands = Brand.where('ame LIKE(?)',"%#{params[:keyword]}%").limit(5)

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @condition_array = [
      '---',
      '新品、未使用',
      '未使用に近い',
      '目立った傷や汚れなし',
      'やや傷や汚れあり',
      '傷や汚れあり',
      '全体的に状態が悪い'
    ]
    @postage_array = [
      '---',
      '送料込み(出品者負担)',
      '着払い(購入者負担)'
    ]
    @lead_time_array = [
      '---',
      '1~2日で発送',
      '2~3日で発送',
      '4~7日で発送'
    ]

    @price  = params[:keyword].to_i
    @fee    = @price * 0.1
    @profit = @price - @fee

    respond_to do |format|
      format.html
      format.json
    end

  end

  def show
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path, notice: '出品が完了しました'
  end

  def index
    @items = Item.includes(:item_images).order('id DESC').limit(10)
    @ladies_items = Item.includes(:item_images).where(category_id: 1).limit(10).order('id DESC')
    @mens_items = Item.includes(:item_images).where(category_id: 205).limit(10).order('id DESC')
    @electrical_appliances = Item.includes(:item_images).where(category_id: 3).limit(10).order('id DESC')
    @toys = Item.includes(:item_images).where(category_id: 493).limit(10).order('id DESC')
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
      item_images_attributes: [
        :image
      ]).merge(
        user_id: current_user.id,
        seller_id: current_user.id,
        display: "open"
      )
  end

end