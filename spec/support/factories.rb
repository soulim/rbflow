Factory.define :user do |f|
  f.name        "John 'user' Doe"
  f.email       "user@example.com"
  f.avatar_url  ""
  f.role        0
end

Factory.define :admin do |f|
  f.name        "John 'admin' Doe"
  f.email       "admin@example.com"
  f.avatar_url  ""
  f.role        1
end

Factory.define :authentication do |f|
  f.sequence(:uid) { |n| "foo-#{n}" }
  f.provider    "foo"
  f.association :user
end

Factory.define :item do |f|
  f.title       "foo"
  f.markdown    "**bar**"
  f.association :user
end

Factory.define :comment do |f|
  f.markdown    "**bar**"
  f.association :item
  f.association :user
end