FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    nickname {"まーたろー"}
    family_name {"真"} 
    first_name {"太郎"}
    family_name_kana {"ま"}
    first_name_kana {"たろう"}
    birthyear_id {"20"}
    birthmonth_id {"5"}
    birthday_id {"23"}

    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
  end
end

