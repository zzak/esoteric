xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "confessions of a ruby house cat"
    xml.description "scratching posts and taking naps"
    xml.link posts_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.author post.author
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
