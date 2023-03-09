# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.534359%2C%20-0.076776&key=9AC57B41B3904084892AE6F378A7437C&category=attractions&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'

response = http.request(request)
obj = JSON.parse(response.read_body)

puts "Destroying all pubs"
Pub.destroy_all
puts "Pubs destroyed"
puts "generating new pubs"

obj["data"].each do |line|
  Pub.create!(name: line["name"], address: line["street1"], phone_number: line["location_id"], pool_table: [true, false].sample, non_alcoholic_drinks_selection: [true, false].sample, garden: [true, false].sample, parking: [true, false].sample, live_sport: [true, false].sample, wheelchair_accessible: [true, false].sample, food_menu: [true, false].sample)
end
puts "end"


# doggy = Dog.create(
#   name: "NES",
#   breed: "fluff",
#   proffession: "doggo",
#   age: 2
# )
