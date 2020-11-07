class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:destroy]
  def index
    @items = Item.all
  end  
  
  def new
    @item = Item.new
    @item.item_images.new
    @category_parent =  Category.where("ancestry is null")
  end

  def show
    @message =Message.new
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
    @category_parent =  Category.where("ancestry is null")
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name,:item_description, :category_id, :conditon_id, :shopping_charges_id,:prefecture_id, :days_to_delivery_id, :price, item_images_attributes:[:image]).merge(user_id: 1)
  end
  # .merge(user_id: current_user.id, boughtflg_id:"1")
  def set_item 
    @item = Item.includes(:messages).find(params[:id])
  end
end

