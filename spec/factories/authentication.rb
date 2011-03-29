Factory.define :authentication do |f|
  f.sequence(:uid) { |n| "foo-#{n}" }
  f.provider    "foo"
  f.association :user
end