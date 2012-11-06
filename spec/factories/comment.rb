FactoryGirl.define do
  factory :comment do
    item
    user
    markdown    "**bar**"
  end
end