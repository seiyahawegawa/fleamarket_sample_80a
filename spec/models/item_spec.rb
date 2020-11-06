require 'rails_helper'

describe Item do
  before do 
    @item = FactoryBot.build(:item)
  end

  describe "#create" do
    it "商品名、価格、商品説明、商品状態、配送料の負担、配送の方法、発送元の地域、発送までの日数、カテゴリー、商品画像が入力されていれば出品可能" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "商品名が40字の場合は出品できる" do
      item = build(:name, name: "a" * 40)
      item.valid?
      expect(item).to be_valid
    end

    it "商品説明が1000文字を越えている場合は出品できない" do
      # irbで`puts "a" * 1000`を出力して1000字の文字列を生成
      item = build(:name, name: "a" * 1000)
      item.valid?
      expect(item.errors[:item_description][0]).to include("is too long")
    end

    it "価格が300円の場合は出品できる" do
      item = build(:item, price: "300")
      item.valid?
      expect(item).to be_valid
    end

    it "価格が9,999,999円の場合は出品できる" do
      item = build(:item, price: "9999999")
      item.valid?
      expect(item).to be_valid
    end
  end

  describe "invalid_create" do
    it "商品名が空では出品できない" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:item_name]).to include("can't be blank")
    end

    it "商品名が40字を越えている場合は出品できない" do
      # irbで`puts "a" * 41`を出力して41字の文字列を生成
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:item_name][0]).to include("is too long")
    end

    it "商品説明が空では出品できない" do
      item = build(:item, introduction: "")
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

    it "商品説明が1000文字を越えている場合は出品できない" do
      # irbで`puts "a" * 1001`を出力して1001字の文字列を生成
      item = build(:item, name: "a" * 1001)

      item.valid?
      expect(item.errors[:introduction][0]).to include("is too long")
    end

    it "価格が空では出品できない" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "価格が300円未満では出品できない" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("greater_than_or_equal_to")
    end

    it "価格が9,999,999円より高い場合は出品できない" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("less_than_or_equal_to")
    end

    it "価格が数字でない場合（文字列の場合）は、出品できない" do
      item = build(:item, price: "aaaa")
      item.valid?
      expect(item.errors[:price]).to include("not a number")
    end

    it "商品の状態が空では出品できない" do
      item = build(:item, state: "")
      item.valid?
      expect(item.errors[:conditon]).to include("can't be blank")
    end

    it "配送料の負担が空では出品できない" do
      item = build(:item, delivery_fee: "")
      item.valid?
      expect(item.errors[:days_to_delivery]).to include("can't be blank")
    end

    it "配送の方法が空では出品できない" do
      item = build(:item, delivery_method: "")
      item.valid?
      expect(item.errors[:delivery_method]).to include("can't be blank")
    end

    it "配送元の地域が空では出品できない" do
      item = build(:item, city: "")
      item.valid?
      expect(item.errors[:city]).to include("can't be blank")
    end

    it "発送までの日数が空では出品できない" do
      item = build(:item, delivery_days: "")
      item.valid?
      expect(item.errors[:delivery_days]).to include("can't be blank")
    end

    it "カテゴリーが空では出品できない" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
  end
end