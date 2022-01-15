# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Clean the DBs
User.destroy_all
Booking.destroy_all
Hug.destroy_all
Review.destroy_all

require "open-uri"
# config locales for Faker (mainly for addresses in fact)
Faker::Config.locale = 'fr'

# Create new users
5.times {
  new_user = User.new(email: Faker::Internet.email, password: 'A123456z')
  new_user.save
}

# Create hugs
users = User.all
10.times {
  file = URI.open('https://picsum.photos/200/300')
  fake_cat = Faker::Emotion.adjective
  new_hug = Hug.new(user_id: users.sample.id, title: Faker::Fantasy::Tolkien.location ,category: fake_cat, description: Faker::Fantasy::Tolkien.poem, city: Faker::Address.city, address: Faker::Address.full_address, price: (2..25).to_a.sample )
  new_hug.photo.attach(io: file, filename: "#{fake_cat}-pict.jpg", content_type: 'image/jpg')
  new_hug.save
}

puts "ok seed done"
