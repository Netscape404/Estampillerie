# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Users
  15.times do |n|
  username = "#{Faker::Internet.user_name}#{n}"
  User.create(
    avatar:       Faker::Avatar.image,
    first_name:   Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    username:     username,
    password:     Faker::Lorem.characters(10),
    email:        Faker::Internet.email,
    gender:       Faker::Boolean.boolean,
    biography:    Faker::Lorem.paragraph,
    address:      Faker::Address.street_address,
    post_code:    Faker::Address.postcode,
    city:         Faker::Address.city,
    country:      Faker::Address.country,
  )
  end
