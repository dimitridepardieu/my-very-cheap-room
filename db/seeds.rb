# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "faker"

puts "Cleaning database..."

Booking.destroy_all
Room.destroy_all
Hotel.destroy_all
User.destroy_all

puts "Creating users..."

User.create!(email: "bob@gmail.com", password: "password")
User.create!(email: "hotel@gmail.com", password: "password")

8.times do
  name = Faker::Name.first_name.downcase
  mail = "#{name}@gmail.com"
  User.create!(email: mail, password: Faker::Alphanumeric.alphanumeric(number: 8))
end

puts "Creating hotels..."

5.times do
  Hotel.create!(
    name: Faker::Coffee.blend_name,
    address: Faker::Address.street_address
  )
end

puts "Creating rooms..."

50.times do
  Room.create!(
    hotel_id: Hotel.all[rand(0..4)].id,
    price_per_night: Faker::Number.between(from: 8, to: 25),
    capacity: Faker::Number.between(from: 1, to: 2)
  )
end

puts "Creating bookings..."

200.times do
  Booking.create!(
    user_id: User.all[rand(2..9)].id,
    room_id: Room.all[rand(0..49)].id,
    starts_at: Faker::Date.between(from: '01-10-2022', to: '30-11-2022'),
    ends_at: Faker::Date.between(from: '01-12-2022', to: '15-01-2023')
  )
end

puts "Seed is done!"
