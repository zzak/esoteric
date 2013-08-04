# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create(
  [
    { title: "If I Had A Nickel",
      author: "Zachary Scott",
      body: "I couldn't buy lunch"
    },
    { title: "For every stupid question",
        author: "Zachary Scott",
        body: "There is an equal and opposite sarcastic remark"
    }
  ]
)




