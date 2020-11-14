class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:destroy]
  def index
    @items = Item.all
  end  
  
  def new
    @item = Item.new
    @item.item_images.new
   
  end

  def show
    @message =Message.new
  end  


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path

    else
    
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end   
  private

  def item_params
    params.require(:item).permit(:item_name,:item_description, :category_id, :conditon_id, :shopping_charges_id,:prefecture_id, :days_to_delivery_id, :price, item_images_attributes:[:image]).merge(user_id: current_user.id )
  end
  def set_item 
    @item = Item.includes(:messages).find(params[:id])
  end
end
 
