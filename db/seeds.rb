# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'

puts "destroy all"
# User.destroy_all

puts "creating alex"
alex = User.create(first_name: 'Alex', last_name: 'Beciana', job_title: "Founder, CEO", department: "Founder", company_name: "Sweet Static", office_phone: "(123) 456-7890", mobile_phone: "(123) 456-7890", website_url: "https://www.alexbeciana.com/", email: "alexb@test.com", address_1: "123 Fake Street", address_2: "Suite 000", address_3: "New York, NY 10001", address_4: "United States of America", linkedin: "https://www.linkedin.com/in/alexbeciana1/", github: "https://github.com/abeciana1/", twitter: "https://twitter.com/", bonus_field: Faker::Movie.quote, password: "1234", profile_image: "https://www.alexbeciana.com/static/profile-pic-942ff21fde4f338dc11fe09b617b1130.png")

puts "creating users"
5.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, job_title: Faker::Job.title, department: Faker::Job.field, company_name: Faker::Company.name, office_phone: Faker::PhoneNumber.cell_phone, mobile_phone: Faker::PhoneNumber.cell_phone, website_url: "https://www.google.com", email: Faker::Internet.email, address_1: Faker::Address.street_address, address_2: Faker::Address.secondary_address, address_3: "#{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}", linkedin: "https://www.linkedin.com/feed/", twitter: "https://twitter.com/", github: "http://github.com/", bonus_field: Faker::Movie.quote, password: "1234", profile_image: Faker::LoremFlickr.image)
end

puts "all seeded"