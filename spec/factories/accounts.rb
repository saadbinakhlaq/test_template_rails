FactoryBot.define do
  factory :account do
    first_name { "MyString" }
    last_name { "MyString" }
    user { nil }
    address { "MyString" }
    phone_number { "MyString" }
  end
end
