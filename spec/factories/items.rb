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

    # 1枚の画像をアップロードする
    trait :item_image do
      after(:build) do |item|
        File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
          item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
        end
      end
    end

    # 11枚の画像をアップロードする
    trait :images do
      after(:build) do |item|
        11.times do
          File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
            item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
          end
        end
      end
    end
  end
end