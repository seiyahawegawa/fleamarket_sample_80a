class MessagesController < ApplicationController
  before_action :set_item
  def new
    # @message = Messages.new
  end

  def create
    @message = @item.messages.new(message_params)
    @item =@message.item
    if @message.save
      redirect_to @item
    end
  end
  private
  def message_params
    params.require(:message).permit(:message,:item_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end
