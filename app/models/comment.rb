class Comment < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  
  validates_presence_of :item_id, :user_id, :markdown
  
  before_save :assign_html, :if => :markdown?
  
  private
  
  def assign_html
    self.html = RDiscount.new(self.markdown, :filter_styles, :filter_html, :autolink).to_html
  end  
end