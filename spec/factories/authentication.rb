FactoryGirl.define do
  factory :authentication do
    user
    sequence(:uid) { |n| "foo-#{n}" }
    provider    "foo"
  end
end