# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

c1 = Category.create(name: 'Fitness')
c2 = Category.create(name: 'Outdoors')
c3 = Category.create(name: 'Tech')
c4 = Category.create(name: 'Gothic')

l1 = Location.create(name: 'Venus')
l2 = Location.create(name: 'Space')
l3 = Location.create(name: 'Saturn')
l4 = Location.create(name: 'Orion Nebula')
l5 = Location.create(name: 'Cloud 9')

m1 = Meetup.create(
  name: 'Things That Like Rings',
  location: l1,
  description: 'We will find objects and put a ring on it'
 
  )

m2 = Meetup.create(
  name: 'Gotic Picnic',
  location: l2,
  description: 'Come hang with your gothy homies and eat sammies'
  
  )
m3 = Meetup.create(
  name: 'Computer Coroders',
  location: l3,
  description: 'We will break our toy computers'
  
  )
m4 = Meetup.create(
  name: 'Fight the Man',
  location: l4,
  description: 'We will fight those pesky humans'
 
  )

u1 = User.create(provider: "github", uid: "182935", username: "GothyMcRubyist", email: "togo@gmail.com", avatar_url: "http://darkroom.baltimoresun.com/wp-content/uploads/2013/05/AFP_Getty-168957549.jpg")
u2 = User.create(provider: "github", uid: "132931", username: "GothRocks143", email: "shelby12@gmail.com", avatar_url: "http://darkroom.baltimoresun.com/wp-content/uploads/2013/05/AFP_Getty-168938390.jpg")
u3 = User.create(provider: "github", uid: "162932", username: "Rainbowsandbutterflies", email: "Ilikecolors@gmail.com", avatar_url: "http://inspired2act.com/images/uploads/mountain_climber.jpg")
u4 = User.create(provider: "github", uid: "122933", username: "LoneStar", email: "spaceball1@gmail.com", avatar_url: "http://orig15.deviantart.net/d5e7/f/2011/215/a/e/aee7304e789a3645bb80aad0262a336c-d434toa.jpg")




Categorization.create(meetup_id: m1, category_id: c2)
Categorization.create(meetup_id: m1, category_id: c3)
Categorization.create(meetup_id: m2, category_id: c2)
Categorization.create(meetup_id: m2, category_id: c4)
Categorization.create(meetup_id: m3, category_id: c3)
Categorization.create(meetup_id: m4, category_id: c1)
Categorization.create(meetup_id: m4, category_id: c4)

Usermeetup.create(user_id: u1.id, meetup_id: m1.id)
Usermeetup.create(user_id: u2.id, meetup_id: m2.id)
Usermeetup.create(user_id: u3.id, meetup_id: m3.id)
Usermeetup.create(user_id: u4.id, meetup_id: m4.id)

