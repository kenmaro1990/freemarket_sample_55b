class PurchaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :pay]

  require "payjp"

  def index
  end

  def show
    card = current_user.card
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @customer_card = customer.cards.retrieve(card.card_id)
  end

  def pay
    card = current_user.card
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    @item.update!(buyer_id: current_user.id)
    redirect_to users_path
  end

  def complete
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
    @address = current_user.address
  end
end
