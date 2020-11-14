class CreditCardsController < ApplicationController
  require "payjp"

  def index
  end
  
  def new
  end
  
  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to root_path(current_user.id)
      else
        redirect_to credit_card_path(current_user.id)
      end
    end
  end

  

  
end
