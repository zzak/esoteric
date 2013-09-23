require 'rss'
require 'open-uri'

url = 'http://localhost:3000/posts.rss'
open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts feed.channel.title
  feed.items.each do |item|
    puts item.title
  end
end

