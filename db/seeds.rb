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

  step_path = Rails.root.join

  consultation = Consultation.new(
    user: user,
    procedure: procedure
  )

  step1 = Step.create(
    name: "1 - Application Form",
    consultation: consultation,
    instruction: "Please fill in the application form (永住許可申請書) and upload the form"
  )

  item1 = Item.create(
    name: "Application Form",
    description: File.open("#{step_path}/items/item1.md").read,
    step: step1
  )

  step2 = Step.create(
    name: "2 - Upload a photograph",
    consultation: consultation,
    instruction: "Please upload photograph based on MOJ website requirements"
  )

  item2 = Item.create(
    name: "Upload a photograph",
    description: File.open("#{step_path}/items/item2.md").read,
    step: step2
  )

  step3 = Step.create(
    name: "3 - Proof of Employment Status",
    consultation: consultation,
    instruction: "Provide 1 copy of the following documents:"
  )

  item3_1 = Item.create(
    name: "If employed - Provide Certificate of Employment",
    description: File.open("#{step_path}/items/item3d_1.md").read,
    step: step3
  )

  item3d_2 = Item.create(
    name: "If self employed - Provide copy of the applicant's tax return, or the corporations' certificate of registered matters",
    description: File.open("#{step_path}/items/item3d_2.md").read,
    step: step3
  )

  item3d_3 = Item.create(
    name: "Other - Clarifying documents or other demonstrative materials which detail their employment (no specified format)",
    description: File.open("#{step_path}/items/item3d_3.md").read,
    step: step3
  )

  step4 = Step.create(
    name: "4 - Residence Card",
    consultation: consultation,
    instruction: "Upload only if applying via a proxy, otherwise please produce your card at the immigration office"
  )

  item4 = Item.create(
    name: "Upload Residence Card",
    description: File.open("#{step_path}/items/item4.md").read,
    step: step4
  )

  step5 = Step.create(
    name: "5 - Written Permission",
    consultation: consultation,
    instruction: "Provide written permission to engage in an activity other than those permitted by the status of residence, previously granted (where applicable)"
  )

  item5 = Item.create(
    name: "Upload written permission",
    description: File.open("#{step_path}/items/item5.md").read,
    step: step5
  )

  step6 = Step.create(
    name: "6 - Passport / Certificate of Eligibility (COE)",
    consultation: consultation,
    instruction: "Upload only if applying via a proxy, otherwise please produce your passport or CoE at the immigration office"
  )

  item6 = Item.create(
    name: "Upload Passport or COE",
    description: File.open("#{step_path}/items/item6.md").read,
    step: step6
  )

  step7 = Step.create(
    name: "7 - *Proxy Only* Documents certifying identity",
    consultation: consultation,
    instruction: "Please produce ID at immigration office"
  )

  item7 = Item.create(
    name: "Documents certifying identity",
    description: File.open("#{step_path}/items/item7.md").read,
    step: step7
  )
  random = rand(1..2)
  if random == 1
    puts 'Creating lawfirms...'
    lawfirm = Lawfirm.create(
      name: "#{Faker::Company.name} LLC",
      user: user,
      location: user.location,
      address: Faker::Address.street_address
    )
    puts "Created lawfirm #{lawfirm.id}, #{lawfirm.name}"
  end

  # random = rand(1..2)
  # if random == 1
  #   puts 'Creating consultations...'
  #   consultation = Consultation.create(
  #     user: user,
  #     procedure: procedure,
  #     lawfirm: lawfirm
  #   )
  #   puts "Created consultation #{consultation.id}"
  # end

  # random = rand(1..2)
  # if random == 1
  #   puts 'Creating messages...'
  #   message = Message.create(
  #     user: user,
  #     consultation: consultation,
  #     content: Faker::Name.first_name
  #   )
  #   puts "Created message #{message.id}"
  # end
end

puts 'Done!'
