class UsersController < ApplicationController
  before_action :check_sign_in

  def index
    @items = Item.where(buyer_id: current_user.id).limit(4)
  end

  def identification
  end
  
  def logout
  end

  def card
  end

  def edit_profile
  end

  def selling
    @items = Item.where(seller_id: current_user.id).where(buyer_id: nil).order(created_at: "DESC")
  end

  def in_progress
    @items = Item.where(seller_id: current_user.id).where.not(buyer_id: nil).order(updated_at: "DESC")
  end

  def completed
    @items = Item.where(seller_id: current_user.id).order(updated_at: "DESC")
  end

  def purchase
    @items = Item.where(buyer_id: current_user.id).order(updated_at: "DESC")
  end

  def purchased
    @items = Item.where(buyer_id: current_user.id).order(updated_at: "DESC")
  end

  def check_sign_in
    redirect_to root_path unless user_signed_in?	
  end
  
end