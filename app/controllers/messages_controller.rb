class MessagesController < ApplicationController
  before_action :set_item,except:[:destroy]
  def create
    @message = @item.messages.new(message_params)
    if @message.save
      redirect_to @item
    end
  end

  def destroy
    # dependent: :destroy
    # binding.pry
    # @item.valid?
    # @item.errors.full_messages
    # binding.pry
    @item = Item.find(params[:id])
    @message = Message.find(params[:item_id])
    if @message.destroy
      redirect_to @item, notice: '削除しました'
      # redirect_to new_item_message_path(@item), notice: '削除しました'
    else  
      redirect_to root_path
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
