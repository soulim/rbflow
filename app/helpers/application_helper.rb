module ApplicationHelper
  # Flash messages as html
  def flash_messages(messages = {})
    messages = flash unless flash.empty?
    messages.collect{ |kind, message| flash_message(message, kind) }.join.html_safe
  end
  
  def flash_message(message, kind = :notice)
    content_tag :div, message, :class => "message #{kind.to_s}"
  end
end
