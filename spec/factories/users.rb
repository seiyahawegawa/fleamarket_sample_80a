FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    nickname {"まーたろー"}
    family_name {"真"} 
    first_name {"太郎"}
    family_name_kana {"ま"}
    first_name_kana {"たろう"}
    birth_date {"1999-01-23"}

    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
  end
end

