# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Destroying consultations...'
Consultation.destroy_all
puts 'Destroying lawfirms...'
Lawfirm.destroy_all
puts 'Destroying users...'
User.destroy_all
puts 'Destroying messages...'
Message.destroy_all
puts 'Clean database!'

puts 'Creating test user...'
user = User.create(
  email: "me@me.com",
  password: 1234567,
  first_name: "No",
  last_name: "Body",
  location: "Tokyo"
)
puts 'Test user created...'

puts 'Creating procedures...'
  procedure = Procedure.create(
    name: "PR"
    )
  puts "Created procedure #{procedure.id}"

# seed the steps

puts 'Creating users...'
25.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '1234567',
    location: ["Tokyo", "Osaka", "Kyoto", "Chiba", "Ibaraki", "Yokohama", "Nagoya", "Shizuoka"].sample
  )
  puts "Created user #{user.id}"

  random = rand(1..2)
  if random == 1
    puts 'Creating procedures...'
    procedure = Procedure.create(
      name: "Immigration"
    )
    puts "Created procedure #{procedure.id}"
  end

  random = rand(1..2)
  if random == 1
    puts 'Creating lawfirms...'
    lawfirm = Lawfirm.create(
      name: Faker::Name.first_name,
      user: user,
      location: ["Tokyo", "Osaka", "Kyoto", "Chiba", "Ibaraki", "Yokohama", "Nagoya", "Shizuoka"].sample
    )
    puts "Created lawfirm #{lawfirm.id}"
  end



  random = rand(1..2)
  if random == 1
    puts 'Creating consultations...'
    consultation = Consultation.create(
      user: user,
      procedure: procedure,
      lawfirm: lawfirm
    )
    puts "Created consultation #{consultation.id}"
  end




  random = rand(1..2)
  if random == 1
    puts 'Creating messages...'
    message = Message.create(
      user: user,
      consultation: consultation,
      content: Faker::Name.first_name
    )
    puts "Created message #{message.id}"
  end
end

puts 'Done!'
