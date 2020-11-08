require 'rails_helper'

describe Item do
  before do 
    category = FactoryBot.create(:category)
    @item = FactoryBot.build(:item, category_id: category.id)
  end

  describe "#create" do
    it "商品名、価格、商品説明、商品状態、配送料の負担、発送元の地域、発送までの日数、カテゴリー、商品画像が入力されていれば出品可能" do
      expect(@item).to be_valid
    end

    it "商品名が40字の場合は出品できる" do

      @item.item_name = "a" * 40
      @item.valid?
      expect(@item).to be_valid
    end

    it "商品説明が1000文字を越えていない場合できる" do
      @item.item_description = "a" * 1000
      @item.valid?
      expect(@item).to be_valid
    end

    it "価格が300円の場合は出品できる" do
      @item.price = "300"
      @item.valid?
      expect(@item).to be_valid
    end

    it "価格が9,999,999円の場合は出品できる" do
      @item.price = "9999999"
      @item.valid?
      expect(@item).to be_valid
    end
  end

  describe "invalid_create" do
    it "商品名が空では出品できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors[:item_name]).to include("can't be blank")
    end

    it "商品名が40字を越えている場合は出品できない" do
      @item.item_name = "a" * 41
      @item.valid?
      
      expect(@item.errors[:item_name][0]).to include("is too long")
    end

    it "商品説明が空では出品できない" do
      @item.item_description = ""
      @item.valid?
      expect(@item.errors[:item_description]).to include("can't be blank")
    end

    it "商品説明が1000文字を越えている場合は出品できない" do
      @item.item_description = "a" * 1003
      @item.valid?
      expect(@item.errors[:item_description][0]).to include("is too long")
    end

    it "価格が空では出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it "価格が300円未満では出品できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "価格が9,999,999円より高い場合は出品できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "価格が数字でない場合（文字列の場合）は、出品できない" do
      @item.price = "aaaa"
      @item.valid?
      expect(@item.errors[:price]).to include("is not a number")
    end

    it "商品の状態が空では出品できない" do
      @item.conditon_id = ""
      @item.valid?
      expect(@item.errors[:conditon_id]).to include("can't be blank")
    end

    it "配送料の負担が空では出品できない" do
      @item.days_to_delivery_id = ""
      @item.valid?
      expect(@item.errors[:days_to_delivery_id]).to include("can't be blank")
    end

    
    it "配送元の地域が空では出品できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "発送までの日数が空では出品できない" do
      @item.shopping_charges_id = ""
      @item.valid?
      expect(@item.errors[:shopping_charges_id]).to include("can't be blank")
    end

    it "カテゴリーが空では出品できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end
    it '画像がない'do
      @item.item_images = ""
      @item.valid?
      expect(item.errors[:image]).to include('画像がありません')
      end
    it '画像が多い'do
      @item = build(:item, :images, user: user, category: category)
      @item.valid?
      expect(item.errors[:image]).to include('10枚まで投稿できます')
    end
  end
end
