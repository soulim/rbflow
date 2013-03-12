ThinkingSphinx::Index.define :item, :with => :active_record do
  indexes html
  indexes user.name, :as => :author
end