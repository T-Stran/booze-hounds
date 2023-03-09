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

pub_photos = %w[
  ./app/assets/images/pub_photos/angel_and-crown.jpeg
  ./app/assets/images/pub_photos/black_pub.jpeg
  ./app/assets/images/pub_photos/gus_o-conner.jpeg
  ./app/assets/images/pub_photos/haggon_horses.jpeg
  ./app/assets/images/pub_photos/harringay_arms.jpeg
  ./app/assets/images/pub_photos/horseshoe.png
  ./app/assets/images/pub_photos/nags_head.jpeg
  ./app/assets/images/pub_photos/o'riley_conways.jpeg
  ./app/assets/images/pub_photos/railway_tavern.jpeg
  ./app/assets/images/pub_photos/red_lion.jpeg
  ./app/assets/images/pub_photos/rivington.jpeg
  ./app/assets/images/pub_photos/shenanigans.jpeg
  ./app/assets/images/pub_photos/sherlock_holm  es.jpeg
  ./app/assets/images/pub_photos/sir_john_cockle.jpeg
  ./app/assets/images/pub_photos/the_beer_shop.jpeg
  ./app/assets/images/pub_photos/the_castle_inn.jpeg
  ./app/assets/images/pub_photos/the_chandos.webp
  ./app/assets/images/pub_photos/the_city_inn.png
  ./app/assets/images/pub_photos/the_netherton.jpeg
  ./app/assets/images/pub_photos/the_old_bank.png
  ./app/assets/images/pub_photos/the_old_toll_bar.jpeg
  ./app/assets/images/pub_photos/the_plough.webp
  ./app/assets/images/pub_photos/the_sevens.jpeg
  ./app/assets/images/pub_photos/the_ship.jpeg
  ./app/assets/images/pub_photos/the_star.jpeg
  ./app/assets/images/pub_photos/the_Stara.jpeg
  ./app/assets/images/pub_photos/the_temple_bar.webp
  ./app/assets/images/pub_photos/the_woodman.jpeg
  ./app/assets/images/pub_photos/woodins_shades.jpeg
]
url = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.534359%2C%20-0.076776&key=#{ENV['TRIPADVISOR_API_KEY']}&category=attractions&language=en")
url1 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.52823812500374%2C%20-0.07807314749853018%2C%20-0.07693326900676305&key=#{ENV['TRIPADVISOR_API_KEY']}&category=attractions&radius=10&radiusUnit=km&language=en")
url2 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.52823812500374%2C%20-0.07807314749853018%2C%20-0.07693326900676305&key=#{ENV['TRIPADVISOR_API_KEY']}&category=restaurants&radiusUnit=km&language=en")
url3 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.532860606366484%2C%20-0.07689292315605466&key=#{ENV['TRIPADVISOR_API_KEY']}&category=restaurants&radiusUnit=km&language=en")
url4 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.53871450324322%2C%20-0.07554002316082299%2C%20-0.07689292315605466&key=#{ENV['TRIPADVISOR_API_KEY']}&category=restaurants&radiusUnit=km&language=en")
url5 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.53871450324322%2C%20-0.07554002316082299%2C%20-0.07689292315605466&key=#{ENV['TRIPADVISOR_API_KEY']}&category=attractions&radiusUnit=km&language=en")
url6 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.5335831709218%2C%20-0.06497159400156856%2C%20-0.07554002316082299%2C%20-0.07689292315605466&key=#{ENV['TRIPADVISOR_API_KEY']}&category=attractions&radiusUnit=km&language=en")
url7 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.5335831709218%2C%20-0.06497159400156856%2C%20-0.07554002316082299%2C%20-0.07689292315605466&key=#{ENV['TRIPADVISOR_API_KEY']}&category=restaurants&radiusUnit=km&language=en")
url8 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.53766272720548%2C%20-0.09112269928287485%2C%20-0.06497159400156856%2C%20-0.07554002316082299%2C%20-0.07689292315605466&key=#{ENV['TRIPADVISOR_API_KEY']}&category=restaurants&radiusUnit=km&language=en")
url9 = URI("https://api.content.tripadvisor.com/api/v1/location/nearby_search?latLong=51.53766272720548%2C%20-0.09112269928287485%2C%20-0.06497159400156856%2C%20-0.07554002316082299%2C%20-0.07689292315605466&key=#{ENV['TRIPADVISOR_API_KEY']}&category=attractions&radiusUnit=km&language=en")

urls = [url, url1, url2, url3, url4, url5, url6, url7, url8, url9]

opening = [9, 10, 11]
closing = [11, 12]
pub_description = ["Fashionably updated Victorian pub with wood floors, big windows and rotating list of unusual beers.",
                   "The perfect place to eat and enjoy freshly brewed, hyper local, award-winning craft beers.",
                   "Cool, vibrant bar on 4 floors with lounges, sofas and roof terrace, serving burgers and pizza.",
                   "Traditional, compact corner pub with bench and stool seating, stripped floors and real ales on tap.",
                   "High-ceilinged pub with fireplace and Chesterfield sofas, plus pizza menu.",
                   "An adventurous pub food menu in a relaxed setting with stripped wooden tables and a fireplace.",
                   "Traditional, cosy pub in the backstreets with original frontage and a rotating choice of real ales.",
                   "Relaxed pub with a warm vibe pouring craft beer & gin drinks amid dark-wood decor & a vintage bar.",
                   "Victorian pub namechecked in the rhyme Pop Goes the Weasel, with courtyard garden and weekly quiz."]

puts "Destroying all pubs"
Pub.destroy_all
puts "Pubs destroyed"
puts "generating new pubs"

urls.each do |url_select|
  http = Net::HTTP.new(url_select.host, url_select.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url_select)
  request["accept"] = 'application/json'

  response = http.request(request)
  obj = JSON.parse(response.read_body)


  obj["data"].each do |line|
    Pub.create!(name: line["name"], address: line["address_obj"]["street1"], postcode: line["address_obj"]["postalcode"], description: pub_description.sample, opening_time: opening.sample, closing_time: closing.sample, phone_number: line["location_id"], pool_table: [true, false].sample, non_alcoholic_drinks_selection: [true, false].sample, garden: [true, false].sample, parking: [true, false].sample, live_sport: [true, false].sample, wheelchair_accessible: [true, false].sample, food_menu: [true, false].sample)
  end
end
puts "end"


# doggy = Dog.create(
#   name: "NES",
#   breed: "fluff",
#   proffession: "doggo",
#   age: 2
# )
