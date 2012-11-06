FactoryGirl.define do
  factory :user do
    name        "John 'user' Doe"
    email       "user@example.com"
    avatar_url  ""
    role        0
  end

  factory :admin do
    name        "John 'user' Doe"
    email       "user@example.com"
    avatar_url  ""
    role        1
  end
end
