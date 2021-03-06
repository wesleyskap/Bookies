xml.instruct! :xml, version: "1.0" 
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Bkmark.me Bookmarks"
    xml.description "Bookmark feed for bkmark.me"
    xml.link bookmarks_url

    @bookmarks.each do |bookmark|
      xml.item do
        xml.title bookmark.title
        xml.description bookmark.desc
        xml.pubDate bookmark.updated_at.to_s(:rfc822)
        xml.link bookmark.url
        xml.guid bookmark_url(bookmark)
      end
    end
  end
end
