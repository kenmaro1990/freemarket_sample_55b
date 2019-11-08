class PurchaseController < ApplicationController
  
  require "payjp"

  def index
  end

  def show
    @user = current_user
    @address = current_user.address

    @item = Item.find(6)
    card = current_user.card
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @customer_card = customer.cards.retrieve(card.card_id)
  end

  def pay

    @user = current_user
    @item = Item.find(6)
    card = current_user.card
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    @item.update!(buyer_id: current_user.id)
  end

  def complete
  end
end
