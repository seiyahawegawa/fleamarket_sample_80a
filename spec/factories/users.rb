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
end