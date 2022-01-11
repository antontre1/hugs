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
  new_hug = Hug.new(user_id: users.sample.id, title: Faker::Fantasy::Tolkien.location ,category: "#{Faker::Emotion.adjective}", description: Faker::Fantasy::Tolkien.poem, city: Faker::Address.city, address: Faker::Address.full_address, price: (2..25).to_a.sample )
  new_hug.save
}

puts "ok seed done"
