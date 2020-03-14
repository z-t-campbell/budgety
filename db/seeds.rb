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
Review.destroy_all
Order.destroy_all

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

experience2 = Experience.new(name: "Maroon 5 Tour", category:"Music Events", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Kensington Gore, South Kensington, London SW7 2AP", date: "2020-04-15", start_time: "2020-04-15 18:00:00", end_time: "2020-04-15 20:00:00", venue_name: "Royal Albert Hall", price_cents: 3500)
experience2.organisation = ticketmaster
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042787/gig3_k4xer4.jpg')
experience2.photos.attach(io: photo, filename: 'maroon5.jpg', content_type: 'image/jpg')
experience2.save!

puts "experiences 2"

experience3 = Experience.new(name: "Chelsea Pub Lunch for 2", category:"Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "119 King's Rd, Chelsea, London SW3 4PL", date: "2020-04-06", start_time: "2020-04-06 18:00:00", end_time: "2020-04-06 20:00:00", venue_name: "Chelsea Potter", price_cents: 2500)
experience3.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/drinks3_njtuzg.jpg')
experience3.photos.attach(io: photo, filename: 'Chelsea.jpg', content_type: 'image/jpg')
experience3.save!

puts "experiences 3"

experience4 = Experience.new(name: "Bottomless Cocktails", category:"Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "129 City Rd, Old Street, London EC1V 1JB", date: "2020-04-20", start_time: "2020-04-20 18:00:00", end_time: "2020-04-20 20:00:00", venue_name: "Nightjar", price_cents: 2000)
experience4.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042779/drinks_j6bfjl.jpg')
experience4.photos.attach(io: photo, filename: 'bottomless.jpg', content_type: 'image/jpg')
experience4.save!

puts "experiences 4"

experience5 = Experience.new(name: "Indoor Rock Climbing Class", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Green Lanes, Stoke Newington, London N4 2HA", date: "2020-04-13", start_time: "2020-04-13 18:00:00", end_time: "2020-04-13 20:00:00", venue_name: "The Castle Climbing Centre", price_cents: 1800)
experience5.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/climbing_pjlvdh.jpg')
experience5.photos.attach(io: photo, filename: 'climbing.jpg', content_type: 'image/jpg')
experience5.save!

puts "experiences 5"

experience6 = Experience.new(name: "Full Face Makeup Class", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "12 Brecknock Rd, London N7 0DD", date: "2020-04-08", start_time: "2020-04-08 18:00:00", end_time: "2020-04-08 20:00:00", venue_name: "Makeup Academy London", price_cents: 3500)
experience6.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/makeup3_ajdcxs.jpg')
experience6.photos.attach(io: photo, filename: 'makeup.jpg', content_type: 'image/jpg')
experience6.save!

puts "experiences 6"

experience7 = Experience.new(name: "Comdey Night for 2", category: "Comedy", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "231 Cambridge Heath Rd, London E2 0EL", date: "2020-04-22", start_time: "2020-04-22 18:00:00", end_time: "2020-04-22 20:00:00", venue_name: "Backyard Comedy Club", price_cents: 1000)
experience7.organisation = breakneck
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042790/comedy_2_w8ndwz.jpg')
experience7.photos.attach(io: photo, filename: 'comedy.jpg', content_type: 'image/jpg')
experience7.save!

puts "experiences 7"

experience8 = Experience.new(name: "Deep Tissue Massage (1 hr)", category: "Beauty & Spa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "York Hall Leisure Centre, Old Ford Rd, Bethnal Green, London E2 9PJ", date: "2020-04-25", start_time: "2020-04-25 18:00:00", end_time: "2020-04-25 20:00:00", venue_name: "Spa Experience", price_cents: 5000)
experience8.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042789/spa1_czayrf.jpg')
experience8.photos.attach(io: photo, filename: 'massage.jpg', content_type: 'image/jpg')
experience8.save!

puts "experiences 8"

experience9 = Experience.new(name: "Ceramics Making (3 hrs)", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Railway Arches, 361-362 Whiston Rd, London E2 8BW", date: "2020-04-28", start_time: "2020-04-28 18:00:00", end_time: "2020-04-28 20:00:00", venue_name: "Turning Earth Hoxton", price_cents: 3000)
experience9.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042781/ceramics2_ur0jma.jpg')
experience9.photos.attach(io: photo, filename: 'ceramics.jpg', content_type: 'image/jpg')
experience9.save!

puts "experiences 9"

experience10 = Experience.new(name: "The Real Greek Meal for 2", category: "Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "54 St Martin's Ln, Covent Garden, London WC2N 4EA", date: "2020-04-21", start_time: "2020-04-21 18:00:00", end_time: "2020-04-21 20:00:00", venue_name: "The Real Greek", price_cents: 2200)
experience10.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042781/food11_sy66hr.jpg')
experience10.photos.attach(io: photo, filename: 'greek.jpg', content_type: 'image/jpg')
experience10.save!

puts "experiences 10"

experience11 = Experience.new(name: "Prince of Egypt", category: "Arts, Theatre & Shows", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "268-269 Tottenham Court Road London, W1T 7AQ", date: "2020-04-07", start_time: "2020-04-07 18:00:00", end_time: "2020-04-07 20:00:00", venue_name: "London's Dominion Theatre", price_cents: 1400)
experience11.organisation = madtheatre
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042784/theatre_6_dy4jh4.jpg')
experience11.photos.attach(io: photo, filename: 'egypt.jpg', content_type: 'image/jpg')
experience11.save!

puts "experiences 11"

experience12 = Experience.new(name: "Honest Burger and Chips for 2", category: "Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "4 Market Pl, Fitzrovia, London W1W 8AD", date: "2020-04-28", start_time: "2020-04-28 18:00:00", end_time: "2020-04-28 20:00:00", venue_name: "HoNest Burger Oxford Circus", price_cents: 1500)
experience12.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584047782/burger_v5qv0p.webp')
experience12.photos.attach(io: photo, filename: 'burger.jpg', content_type: 'image/jpg')
experience12.save!

puts "experiences 12"


experience13 = Experience.new(name: "Afternoon Tea at The Bloomsbury", category: "Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "16-22 Great Russell St, Bloomsbury, London WC1B 3NN", date: "2020-04-28", start_time: "2020-04-28 18:00:00", end_time: "2020-04-28 20:00:00", venue_name: "The Bloomsbury Hotel", price_cents: 2100)
experience13.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042782/food12_oj6mpw.jpg')
experience13.photos.attach(io: photo, filename: 'burger.jpg', content_type: 'image/jpg')
experience13.save!

puts "experiences 13"

experience14 = Experience.new(name: "Steakhouse Sirloin Steak and Side", category: "Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "17 Beak St, Soho, London W1F 9RW", date: "2020-04-20", start_time: "2020-04-20 18:00:00", end_time: "2020-04-20 20:00:00", venue_name: "Flat Iron", price_cents: 2000)
experience14.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042787/food5_nrhytp.jpg')
experience14.photos.attach(io: photo, filename: 'steak.jpg', content_type: 'image/jpg')
experience14.save!

puts "experiences 14"

experience15 = Experience.new(name: "Go Kart Racing for 2", category: "Thrill Seeking", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "The Arches, 422-424, Burdett Rd, Mile End, London E3 4AA", date: "2020-04-07", start_time: "2020-04-07 18:00:00", end_time: "2020-04-07 20:00:00", venue_name: "Revolution Karting", price_cents: 3000)
experience15.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042787/gocart_bsdlvd.jpg')
experience15.photos.attach(io: photo, filename: 'gokart.jpg', content_type: 'image/jpg')
experience15.save!

puts "experiences 15"

experience16 = Experience.new(name: "Chocolate Making Class", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Chance Marketing Ltd, Baldwin's Gardens, Holborn, London EC1N 7RJ", date: "2020-04-07", start_time: "2020-04-07 18:00:00", end_time: "2020-04-07 20:00:00", venue_name: "My Chocolate", price_cents: 2300)
experience16.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/chockmaking_gf7xnz.jpg')
experience16.photos.attach(io: photo, filename: 'chocolate.jpg', content_type: 'image/jpg')
experience16.save!

puts "experiences 16"

experience17 = Experience.new(name: "Thai London - 3 Courses ", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "1 Dock Rd, Royal Docks, London E16 1AH", date: "2020-04-07", start_time: "2020-04-07 18:00:00", end_time: "2020-04-07 20:00:00", venue_name: "Thai London", price_cents: 3000)
experience17.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042778/thai2_gkohrw.jpg')
experience17.photos.attach(io: photo, filename: 'thai.jpg', content_type: 'image/jpg')
experience17.save!

puts "experiences 17"

experience18 = Experience.new(name: "Hamilton The Musical", category: "Arts, Theatre & Shows", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "The Royal Court Theatre, Sloane Square, Belgravia, London SW1W 8AS", date: "2020-04-07", start_time: "2020-04-07 18:00:00", end_time: "2020-04-07 20:00:00", venue_name: "The Royal Court Theatre", price_cents: 4000)
experience18.organisation = madtheatre
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042788/theatre4_aoidpe.jpg')
experience18.photos.attach(io: photo, filename: 'thai.jpg', content_type: 'image/jpg')
experience18.save!

puts "experiences 18"

experience19 = Experience.new(name: "Katy Perry Tour", category:"Music Events", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Kensington Gore, South Kensington, London SW7 2AP", date: "2020-04-18", start_time: "2020-04-18 18:00:00", end_time: "2020-04-18 20:00:00", venue_name: "Royal Albert Hall", price_cents: 3500)
experience19.organisation = ticketmaster
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042779/katy3_y98tmr.jpg')
experience19.photos.attach(io: photo, filename: 'katyperry.jpg', content_type: 'image/jpg')
experience19.save!

puts "experiences 19"

experience20 = Experience.new(name: "Bubble Football for 2", category: "Thrill Seeking", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "The Arches, 422-424, Burdett Rd, Mile End, London E3 4AA", date: "2020-04-07", start_time: "2020-04-07 18:00:00", end_time: "2020-04-07 20:00:00", venue_name: "Revolution Karting", price_cents: 3000)
experience20.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042784/football_iaunrf.jpg')
experience20.photos.attach(io: photo, filename: 'football.jpg', content_type: 'image/jpg')
experience20.save!

puts "experiences 20"

experience21 = Experience.new(name: "1 Day Spa Pass", category: "Beauty & Spa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "York Hall Leisure Centre, Old Ford Rd, Bethnal Green, London E2 9PJ", date: "2020-04-25", start_time: "2020-04-25 18:00:00", end_time: "2020-04-25 20:00:00", venue_name: "Spa Experience", price_cents: 3200)
experience21.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042789/spa_6_megog8.jpg')
experience21.photos.attach(io: photo, filename: 'spa.jpg', content_type: 'image/jpg')
experience21.save!

puts "experiences 21"

experience22 = Experience.new(name: "Beyonce Tour", category:"Music Events", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Peninsula Square, Greenwich Peninsula, London SE10 0DX", date: "2020-04-03", start_time: "2020-04-03 19:00:00", end_time: "2020-04-03 21:00:00", venue_name: "O2 Arena", price_cents: 4000)
experience22.organisation = ticketmaster
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042778/bey_hvw0wj.jpg')
experience22.photos.attach(io: photo, filename: 'beyonce.jpg', content_type: 'image/jpg')
experience22.save!

puts "experiences 22"

experience23 = Experience.new(name: "Maroon 5 Tour", category:"Music Events", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Kensington Gore, South Kensington, London SW7 2AP", date: "2020-04-15", start_time: "2020-04-15 18:00:00", end_time: "2020-04-15 20:00:00", venue_name: "Royal Albert Hall", price_cents: 3500)
experience23.organisation = ticketmaster
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042787/gig3_k4xer4.jpg')
experience23.photos.attach(io: photo, filename: 'maroon5.jpg', content_type: 'image/jpg')
experience23.save!

puts "experiences 23"

experience24 = Experience.new(name: "Chelsea Pub Lunch for 2", category:"Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "119 King's Rd, Chelsea, London SW3 4PL", date: "2020-04-06", start_time: "2020-04-06 18:00:00", end_time: "2020-04-06 20:00:00", venue_name: "Chelsea Potter", price_cents: 2500)
experience24.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/drinks3_njtuzg.jpg')
experience24.photos.attach(io: photo, filename: 'Chelsea.jpg', content_type: 'image/jpg')
experience24.save!

puts "experiences 24"

experience25 = Experience.new(name: "Bottomless Cocktails", category:"Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "129 City Rd, Old Street, London EC1V 1JB", date: "2020-04-20", start_time: "2020-04-20 18:00:00", end_time: "2020-04-20 20:00:00", venue_name: "Nightjar", price_cents: 2000)
experience25.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042779/drinks_j6bfjl.jpg')
experience25.photos.attach(io: photo, filename: 'bottomless.jpg', content_type: 'image/jpg')
experience25.save!

puts "experiences 25"

experience26 = Experience.new(name: "Indoor Rock Climbing Class", category: "Classes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "Green Lanes, Stoke Newington, London N4 2HA", date: "2020-04-13", start_time: "2020-04-13 18:00:00", end_time: "2020-04-13 20:00:00", venue_name: "The Castle Climbing Centre", price_cents: 1800)
experience26.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/climbing_pjlvdh.jpg')
experience26.photos.attach(io: photo, filename: 'climbing.jpg', content_type: 'image/jpg')
experience26.save!

puts "experiences 26"

experience27 = Experience.new(name: "Chelsea Pub Lunch for 2", category:"Food & Drink", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", location: "119 King's Rd, Chelsea, London SW3 4PL", date: "2020-04-06", start_time: "2020-04-06 18:00:00", end_time: "2020-04-06 20:00:00", venue_name: "Chelsea Potter", price_cents: 2500)
experience27.organisation = groupon
photo = URI.open('https://res.cloudinary.com/dmwa29qvx/image/upload/v1584042786/drinks3_njtuzg.jpg')
experience27.photos.attach(io: photo, filename: 'Chelsea.jpg', content_type: 'image/jpg')
experience27.save!

puts "experiences 27"

