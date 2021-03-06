class CreditCardsController < ApplicationController
  #require "payjp"
  
  def index
  end

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    if params['payjp_token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp_token'],
        metadata: {user_id_id: current_user.id}
      )
      # @credit = CreditCard.new(card_params)
      @credit = CreditCard.new(user_id: current_user.id, card_id: customer.default_card ,customer_id: customer.id)
      if @credit.save
        redirect_to credit_card_path(current_user.id)
      else
        redirect_to new_credit_card_path(current_user.id)
      end
    end
  end
  
  def show
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand
      # case @card_brand
      # when "visa"
      #   @card_src = "visa.gif"
      # when "JCB"
      #   @card_src = "jcb.gif"
      # when "MasterCard"
      #   @card_src = "mastercard.gif"
      # when "amex"
      #   @card_src = "amex.gif"
      # end

    end
  end
  
  def destroy
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      # redirect_to action: "new"
  end

 
end