# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')


Category.create(category: 'Fitness')
Category.create(category: 'Outdoors')
Category.create(category: 'Tech')
Category.create(category: 'Gothic')

Location.create(location: 'Venus')
Location.create(location: 'Space')
Location.create(location: 'Saturn')
Location.create(location: 'Orion Nebula')
Location.create(location: 'Cloud 9')

Meetup.create(
  name: 'Things That Like Rings',
  location: 'Saturn',
  description: 'We will find objects and put a ring on it',
  category: 'Fitness','Outdoors',
  date: '2057-05-17 00:00:00'
  )
Meetup.create(
  name: 'Gotic Picnic',
  location: 'Cloud 9',
  description: 'Come hang with your gothy homies and eat sammies',
  category: 'Gothic', 'Outdoors',
  date: '2057-05-15 15:00:00'
  )
Meetup.create(
  name: 'Computer Coroders',
  location: 'Orion Nebula',
  description: 'We will break our toy computers',
  category: 'Tech' ,
  date: '2057-05-12 11:00:00'
  )
Meetup.create(
  name: 'Fight the Man',
  location: 'Space',
  description: 'We will fight those pesky humans',
  category: 'Gothic', 'Fitness',
  date: '2057-05-11 5:00:00'
  )

