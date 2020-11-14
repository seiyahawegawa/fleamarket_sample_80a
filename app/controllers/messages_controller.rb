class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to "/items/#{@message.item.id}"
    end
  end

  def destroy
    @message = Message.find(params[:item_id])
    if @message.destroy
      redirect_to "/items/#{@message.item.id}", notice: '削除しました'
    else  
      redirect_to root_path
    end
  end  
  private
  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id,item_id:params[:item_id])
  end
end
