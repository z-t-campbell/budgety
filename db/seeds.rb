# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(
#   name: 'Your name',
#   email: '')

require "open-uri"

User.destroy_all
Organisation.destroy_all
Experience.destroy_all

puts "creating users"
maria = User.create(email: "maria@cool.com", password: "123456", first_name: "Maria", last_name: "Stefan")
lucy = User.create(email: "lucy@cool.com", password: "123456", first_name: "Lucy", last_name: "Williamson")
puts "users created"


puts "creating organisations"
ticketmaster = Organisation.new(name: "Ticket Master", location: "Westminster")
ticketmaster.user = maria
ticketmaster.save
puts "created ticketmaster"

smilecomedy = Organisation.new(name: "Smile Comedy", location: "Essex")
smilecomedy.user = lucy
smilecomedy.save!

puts "created Smile Comedy"

theatretoday = Organisation.new(name: "Theatre Today", location: "Brixton")
theatretoday.user = maria
theatretoday.save!

puts "created theatretoday"

gigscentral = Organisation.new(name: "Gigs Central", location: "Hoxton")
gigscentral.user = maria
gigscentral.save!

puts "created gigscentral"

puts "creating experiences"

10.times do
  experience = Experience.new(name: "Live Jazz Band", category:"Arts, Theatre & Shows", description: "Vintage Jazz and Swing - starting as an elegant and stylish duo consisting of female vocals/drums and guitar (ideal for romantic/background events) then add additional musicians on double bass/clarinet/horn for trio/band options", location: "Old Street", date: "2020-03-03", start_time: "2020-03-03 21:25:00", end_time: "2020-03-03 21:25:00", venue_name: "Jazz Cafe", price_cents: 2000)
  experience.organisation = gigscentral
  photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1583270551/jazz_swypfs.jpg')
  experience.photos.attach(io: photo, filename: 'jazz.jpg', content_type: 'image/jpg')
  experience.save!
  puts "experiences created"
end

10.times do
  experience = Experience.new(name: "Le Miserable", category:"Arts, Theatre & Shows", description: "Jean Valjean, a prisoner, breaks parole in order to start life anew. He soon becomes the caretaker of a young girl but his past comes back to catch up with him.", location: "Camden", date: "2020-03-03", start_time: "2020-03-03 21:25:00", end_time: "2020-03-03 21:25:00", venue_name: "Royal Theare", price_cents: 4000)
  photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1583271068/le_mis_oc2o6d.png')
  experience.organisation = theatretoday
  experience.photos.attach(io: photo, filename: 'lemis.jpg', content_type: 'image/jpg')
  experience.save!
  "experiences created"
end

10.times do
  experience = Experience.new(name: "Best in UK Comedy", category:"Comedy", description: "MC Sally Anne Hayward, Judi Love, Allyson June Smith, Tania Edwards and Abigoliah Schamaun plus open spots. Doors open 6pm. Happy Hour 6pm -7pm. Strictly over 18's.", location: "Brixton", date: "2020-03-03", start_time: "2020-03-03 21:25:00", end_time: "2020-03-03 21:25:00", venue_name: "London Comdey Club", price_cents: 1500)
  photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1583436711/comedy2_nmm8wz.jpg')
  experience.organisation = smilecomedy
  experience.photos.attach(io: photo, filename: 'comedy.jpg', content_type: 'image/jpg')
  experience.save!
  "experiences created"
end
