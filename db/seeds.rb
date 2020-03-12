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
maria = User.create!(email: "maria@cool.com", password: "123456", first_name: "Maria", last_name: "Stefan")
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042777/profile_bocet6.jpg')
maria.photo = photo
james = User.create!(email: "james@cool.com", password: "123456", first_name: "James", last_name: "Williamson")
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042777/profil2_unizy0.jpg')
james.photo = photo
puts "users created"


puts "creating organisations"

ticketmaster = Organisation.new(name: "Ticket Master", location: "Westminster")
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042777/ticketmaster-banner2500w_occdfa.png')
ticketmaster.photo = photo
ticketmaster.user = maria
ticketmaster.save!

puts "created ticketmaster"

breakneck = Organisation.new(name: "Breakneck Comedy", location: "Islington")
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042777/logo_square_png_mykwi7.png')
breakneck.photo = photo
breakneck.user = maria
breakneck.save!

puts "created breakneck"

madtheatre = Organisation.new(name: "Mad Theatre", location: "Brixton")
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042777/mad-newlogo-white-large_1_m0xchh.jpg')
madtheatre.photo = photo
madtheatre.user = maria
madtheatre.save!

puts "created mad theatre"

groupon = Organisation.new(name: "Groupon", location: "Hoxton")
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042777/USU-groupon_afdxdt.png')
groupon.photo = photo
groupon.user = maria
groupon.save!

puts "created groupon"

puts "creating experiences"

experience1 = Experience.new(name: "Beyonce Tour", category:"Music Events", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Peninsula Square, Greenwich Peninsula, London SE10 0DX", date: "2020-04-03", start_time: "2020-04-03 19:00:00", end_time: "2020-04-03 21:00:00", venue_name: "O2 Arena", price_cents: 4000)
experience1.organisation = ticketmaster
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042778/bey_hvw0wj.jpg')
experience1.photos.attach(io: photo, filename: 'beyonce.jpg', content_type: 'image/jpg')
experience1.save!

puts "experiences 1"

experience2 = Experience.new(name: "Maroon 5 Tour", category:"Music Events", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Kensington Gore, South Kensington, London SW7 2AP", date: "2020-04-15", start_time: "2020-04-15 18:00:00", end_time: "2020-04-15 20:00:00", venue_name: "Royal Albert Hall", price_cents: 35000)
experience2.organisation = ticketmaster
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042787/gig3_k4xer4.jpg')
experience2.photos.attach(io: photo, filename: 'maroon5.jpg', content_type: 'image/jpg')
experience2.save!

puts "experiences 2"

experience3 = Experience.new(name: "Chelsea Pub Lunch for 2", category:"Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "119 King's Rd, Chelsea, London SW3 4PL", date: "2020-04-06", start_time: "2020-04-06 18:00:00", end_time: "2020-04-06 20:00:00", venue_name: "Chelsea Potter", price_cents: 25000)
experience3.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/drinks3_njtuzg.jpg')
experience3.photos.attach(io: photo, filename: 'Chelsea.jpg', content_type: 'image/jpg')
experience3.save!

puts "experiences 3"

experience4 = Experience.new(name: "Bottomless Cocktails", category:"Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "129 City Rd, Old Street, London EC1V 1JB", date: "2020-04-20", start_time: "2020-04-20 18:00:00", end_time: "2020-04-20 20:00:00", venue_name: "Nightjar", price_cents: 20000)
experience4.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042779/drinks_j6bfjl.jpg')
experience4.photos.attach(io: photo, filename: 'bottomless.jpg', content_type: 'image/jpg')
experience4.save!

puts "experiences 4"

experience5 = Experience.new(name: "Indoor Rock Climbing Class", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Green Lanes, Stoke Newington, London N4 2HA", date: "2020-04-13", start_time: "2020-04-13 18:00:00", end_time: "2020-04-13 20:00:00", venue_name: "The Castle Climbing Centre", price_cents: 18000)
experience5.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/climbing_pjlvdh.jpg')
experience5.photos.attach(io: photo, filename: 'climbing.jpg', content_type: 'image/jpg')
experience5.save!

puts "experiences 5"

experience6 = Experience.new(name: "Full Face Makeup Class", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "12 Brecknock Rd, London N7 0DD", date: "2020-04-08", start_time: "2020-04-08 18:00:00", end_time: "2020-04-08 20:00:00", venue_name: "Makeup Academy London", price_cents: 35000)
experience6.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/makeup3_ajdcxs.jpg')
experience6.photos.attach(io: photo, filename: 'makeup.jpg', content_type: 'image/jpg')
experience6.save!

puts "experiences 6"

experience7 = Experience.new(name: "Comdey Night for 2", category: "Comedy", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "231 Cambridge Heath Rd, London E2 0EL", date: "2020-04-22", start_time: "2020-04-22 18:00:00", end_time: "2020-04-22 20:00:00", venue_name: "Backyard Comedy Club", price_cents: 10000)
experience7.organisation = breakneck
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042790/comedy_2_w8ndwz.jpg')
experience7.photos.attach(io: photo, filename: 'comedy.jpg', content_type: 'image/jpg')
experience7.save!

puts "experiences 7"

experience8 = Experience.new(name: "Deep Tissue Massage (1 hr)", category: "Beauty & Spa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "York Hall Leisure Centre, Old Ford Rd, Bethnal Green, London E2 9PJ", date: "2020-04-25", start_time: "2020-04-25 18:00:00", end_time: "2020-04-22 25:00:00", venue_name: "Spa Experience", price_cents: 50000)
experience8.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042789/spa1_czayrf.jpg')
experience8.photos.attach(io: photo, filename: 'massage.jpg', content_type: 'image/jpg')
experience8.save!

puts "experiences 8"
