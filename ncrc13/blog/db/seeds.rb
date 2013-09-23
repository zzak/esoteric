# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Post(id: integer, title: string, author: string, body: text)

Post.create(
  :title => "Get Meowta Here!",
  :author => "ag_dubs",
  :body => "I am a cat. My fur is grey and I'm kinda sad looking in the face part of my body.  I do have a skateboard though, and I gotta tell you. It is amazing.  This skateboard is made of PIZZA.  PEPPERONI pizza.  ... and I really like it theoretically, but practically speaking, it is quite difficult to use."
)

Post.create(
  :title => "The Cat in the Hat",
  :author => "ag_dubs",
  :body => "Did you know that cat gangs exist? I seriously had no idea. The other day I was talking in this alley and I saw 3 cats that looked pretty rough. The leader was sitting on a chair and wearing a pretty cool hat and he and his cat followers were waving at me ominously. I was pretty freaked out.  Regardless of how scared I was though, I've been thinking about that hat and am thinking of going back there and asking him where he got it. Thoughts?"
)

Post.create(
  :title => "The Animal Life",
  :author => "ag_dubs",
  :body => "Being an animal is hard. Some of you get what I mean, but I think a lot of you don't. Let me break it down for you: Imagine a cloud in outer space, but like, with an Instagram filter. Except, instead of making it look more old timey, the filter makes it look way futuristic. And so you are near this cloud... and floating on a sandwich. The gravity in outer space makes the sandwich bounce. Guess what type of sandwich it is? JUST GUESS.  I am so freaked out."
)
