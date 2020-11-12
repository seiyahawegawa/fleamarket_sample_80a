FactoryBot.define do
  factory :item do
    item_name             {"hoge"}
    item_description             {Faker::Lorem.sentence}
    conditon_id     {1}
    shopping_charges_id  {1}
    prefecture_id          {13}
    days_to_delivery_id {1}
    price            {"9999"}
    # アソシエーション
    user
    category
    after(:build) do |item|
      item.item_images << FactoryBot.build(:item_image, item: item)
    end  
  end
end