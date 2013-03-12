class Item < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates_presence_of :title, :markdown
  validates_presence_of :user_id, :on => :create

  attr_accessible :title, :markdown

  before_save :assign_html, :if => :markdown?

  scope :recent, includes(:user).order("created_at desc")

  def author?(user)
    self.user_id == user.id
  end

  def author_name
    self.user.blank? ? "" : self.user.name
  end

  private

  def assign_html
    self.html = RDiscount.new(self.markdown, :filter_styles, :filter_html, :autolink).to_html
  end
end
