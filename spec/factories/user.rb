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