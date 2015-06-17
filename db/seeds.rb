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
  location: l2,
  description: 'We will find objects and put a ring on it',
  date: '2057-05-17 00:00:00'
  )

m2 = Meetup.create(
  name: 'Gotic Picnic',
  location: l5,
  description: 'Come hang with your gothy homies and eat sammies',
  date: '2057-05-15 15:00:00'
  )
m3 = Meetup.create(
  name: 'Computer Coroders',
  location: l4,
  description: 'We will break our toy computers',
  date: '2057-05-12 11:00:00'
  )
m4 = Meetup.create(
  name: 'Fight the Man',
  location: l2,
  description: 'We will fight those pesky humans',
  date: '2057-05-11 5:00:00'
  )

Categorization.create(meetup_id: m1, category_id: c2)
Categorization.create(meetup_id: m1, category_id: c3)
Categorization.create(meetup_id: m2, category_id: c2)
Categorization.create(meetup_id: m2, category_id: c4)
Categorization.create(meetup_id: m3, category_id: c3)
Categorization.create(meetup_id: m4, category_id: c1)
Categorization.create(meetup_id: m4, category_id: c4)
