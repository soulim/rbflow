Factory.define :comment do |f|
  f.markdown    "**bar**"
  f.association :item
  f.association :user
end