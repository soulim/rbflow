xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title t("layouts.application.title")
    xml.description t("layouts.application.meta_description")
    xml.link items_url
    xml.language('ru-ru')

    for item in @items.select{ |item| item.user.approved? }
      xml.item do
        xml.title item.title
        xml.description item.html
        xml.pubDate item.created_at.to_s(:rfc822)
        xml.link item_url(item)
        xml.guid item_url(item)
      end
    end
  end
end