FactoryGirl.define do
  factory :item do
    user
    title       "foo"
    markdown    "**bar**"
  end
end