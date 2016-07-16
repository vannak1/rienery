# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(name: "John Apple", email: "1@mail.com", password: "12345678", role: 2)
user2 =  User.create(name: "Bob Orange", email: "2@mail.com", password: "12345678", role: 0)
course1 = Course.create(title: "Reading 101",
              description: "We'll start with the foundations of reading.",
              )
course2 = Course.create(title: "Reading 102",
              description: "A more advanced course on literacy.",
              )
lesson1 = course1.lessons.create(title: "Phonics", content: "<iframe width='560' height='315' src='https://www.youtube.com/embed/KThdffor42g' frameborder='0' allowfullscreen></iframe>")
discussion1 = user1.discussions.create(title: "How do I improve my speaking?",
              content: "I don't know where to begin.  Could you suggest resources."
)
discussion2 = user2.discussions.create(title: "Spelling Tips",
              content: "I'm not gooood spell. How to geet betta"
)
discussion1.comments.create(content: "Practice speaking with someone in real life.", user_id: user1.id)
