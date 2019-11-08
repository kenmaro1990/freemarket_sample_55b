class CardController < ApplicationController

  require "payjp"

  def new

  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: params[:payjpToken])
    redirect_to complete_signup_index_path
  end

  def destroy
    card = current_user.card
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
      redirect_to users_path
  end

  def show
    card = current_user.card
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
  end

  def buy
  end

end