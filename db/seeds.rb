# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Destroying old seeds"
# Review.destroy_all
# Booking.destroy_all
Pub.destroy_all
# User.destroy_all
puts "Destroyed"
puts "Generating new seeds"

theFloristArms = Pub.new(
  name: "The Florist Arms",
  address: "255 Globe Road",
  description: "This pub is called, The Florist Arms",
  opening_time: "06/03/2023 10:00",
  closing_time: "06/03/2023 23:00",
  website: "https://www.floristarms.co.uk/",
  phone_number: "07124712334",
  pool_table: true,
  non_alcoholic_drinks_selection: true,
  garden: false,
  parking: true,
  live_sport: false,
  wheelchair_accessible: true,
  food_menu: true
)
theFloristArms.save!

threeColtsTavern = Pub.new(
  name: "Three Colts Tavern",
  address: "199 Cambridge Heath Road",
  description: "This pub is called, Three Colts Tavern",
  opening_time: "06/03/2023 10:00",
  closing_time: "06/03/2023 23:00",
  website: "https://www.threecoltstavern.co.uk/",
  phone_number: "074132256523",
  pool_table: true,
  non_alcoholic_drinks_selection: false,
  garden: false,
  parking: false,
  live_sport: true,
  wheelchair_accessible: false,
  food_menu: true
)
threeColtsTavern.save!

howlAtMoon = Pub.new(
  name: "Howl At The Moon",
  address: "178 Hoxton St",
  description: "This pub is called, Howl At The Moon",
  opening_time: "06/03/2023 10:00",
  closing_time: "06/03/2023 23:00",
  website: "http://www.hoxtonpub.com/",
  phone_number: "07027563755",
  pool_table: true,
  non_alcoholic_drinks_selection: false,
  garden: true,
  parking: true,
  live_sport: true,
  wheelchair_accessible: false,
  food_menu: true
)
howlAtMoon.save!

theGeorgeAndVulture = Pub.new(
  name: "The George and Vulture",
  address: "63 Pitfield St",
  description: "This pub is called, The George & Vulture",
  opening_time: "06/03/2023 10:00",
  closing_time: "06/03/2023 23:00",
  website: "https://georgeandvulture.com/",
  phone_number: "07553357362",
  pool_table: false,
  non_alcoholic_drinks_selection: false,
  garden: false,
  parking: false,
  live_sport: false,
  wheelchair_accessible: false,
  food_menu: false
)
theGeorgeAndVulture.save!

theRedLion = Pub.new(
  name: "The Red Lion",
  address: "41 Hoxton St",
  description: "This pub is called, The Red Lion",
  opening_time: "06/03/2023 10:00",
  closing_time: "06/03/2023 23:00",
  website: "https://www.redlionhoxton.co.uk/",
  phone_number: "07347651036",
  pool_table: true,
  non_alcoholic_drinks_selection: true,
  garden: true,
  parking: true,
  live_sport: true,
  wheelchair_accessible: true,
  food_menu: true
)
theRedLion.save!

# doggy = Dog.create(
#   name: "NES",
#   breed: "fluff",
#   proffession: "doggo",
#   age: 2
# )
