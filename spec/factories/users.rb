FactoryBot.define do
  factory :user do
    nickname              {"hoge"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    encrypted_password    {"0000000"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date             {"2000-01-01"}
  end
  
  factory :address do
    address_family_name   {"山田"}
    address_first_name    {"太郎"}
    address_family_name_kana  {"ヤマダ"}
    address_first_name_kana   {"タロウ"}
    post_code             {"000-0000"}
    prefecture_id         {"東京都"}
    city                  {"渋谷区"}
    address_line          {"1-1-1"}
    building_name         {"一ビル"}
    phone_number          {"0000000000"}
  end
end