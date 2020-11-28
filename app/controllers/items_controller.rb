class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:destroy,:edit,:update]
  def index
    @items = Item.all
  end  
  
  def new
    @item = Item.new
    @item.item_images.new
    @category_parent = Category.where("ancestry is null")
  end

  def show
    @message = Message.new
  end  
  # 親カテゴリーが選択された後に動くアクション
  def category_children
    @category_children = Category.find(params[:parent_id]).children

    #親カテゴリーに紐付く子カテゴリーを取得
  end

  # 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    #子カテゴリーに紐付く孫カテゴリーの配列を取得
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path

    else
      @category_parent = Category.where(ancestry: nil)
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

  def edit
    # エラー防止の為仮置でインスタンス変数を定義
    @category_parent = Category.where("ancestry is null")
    @item.item_images.new
  end

  def update
    @category_parent = Category.where("ancestry is null")
    if @item.update(item_params)
      redirect_to root_path, notice: '更新しました'
    else
      render :edit
    end
  end

  def buy
    @user = current_user
    card = CreditCard.where(user_id: current_user.id).first
    @item = Item.find(params[:id])
    # @items = ItemImages.find(params[:id])
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    @addresses = Address.where(user_id: current_user.id).first
  end

  def purchase
    @creditcard = CreditCard.where(user_id: current_user.id).first
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    charge = Payjp::charge.create(
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@creditcard.customer_id),
      currency: 'jpy'
    )
    @item_buyer = Item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
    redirect_to root_path
  end

  def purchased
    
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name,:item_description, :category_id, :conditon_id, :shopping_charges_id,:prefecture_id, :days_to_delivery_id, :price, item_images_attributes:[:image]).merge(user_id: current_user.id )
  end
  def set_item 
    @item = Item.includes(:messages).find(params[:id])
  end
end
 
