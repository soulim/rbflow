Factory.define :item do |f|
  f.title       "foo"
  f.markdown    "**bar**"
  f.association :user
end