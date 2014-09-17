# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  'Example User',
             email: 'foo@example.com')

# create users
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"

  User.create!(name:  name,
               email: email)
end

# create events
users = User.take(10)
10.times do
  users.each do |user|
    title = Faker::Lorem.sentence(1, true, 2)
    location = Faker::Address.city
    later = rand(100)
    date  = Time.zone.now
    rand(2) == 1 ? date += later.days : date -= later.days
    if(rand(2) == 1)
      user.events.create!(title: title, location: location, date: date)
    end
  end
end

# attend some events
50.times do
  event = Event.offset(rand(Event.count)).take
  user = User.offset(rand(User.count)).take
  unless event.attendees.include? user
    event.attendees << user
    user.attended_events << event
  end
end
