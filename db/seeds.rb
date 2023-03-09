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
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375905/BoozeHounds/pubs/pubs/the_old_bank_bwlxik.png
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375904/BoozeHounds/pubs/pubs/the_temple_bar_t5aalp.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375904/BoozeHounds/pubs/pubs/the_Stara_lwhjl1.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375904/BoozeHounds/pubs/pubs/gus_o-conners_yndvn5.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375904/BoozeHounds/pubs/pubs/o_riley_conways_jmllxh.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375904/BoozeHounds/pubs/pubs/the_star_mib1pf.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375904/BoozeHounds/pubs/pubs/the_castle_inn_ew5yyo.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375904/BoozeHounds/pubs/pubs/nags_head_sigyrm.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375903/BoozeHounds/pubs/pubs/the_ship_jmuqux.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375903/BoozeHounds/pubs/pubs/sherlock_holmes_jgyhle.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375903/BoozeHounds/pubs/pubs/black_pub_h0kulx.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375903/BoozeHounds/pubs/pubs/the_old_toll_bar_efhzye.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375903/BoozeHounds/pubs/pubs/the_netherton_mfmv3r.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377765/BoozeHounds/pubs/pubs/pubs%202/the_chandos_chud8p.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377762/BoozeHounds/pubs/pubs/pubs%202/the_city_inn_s0uu0z.png
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377761/BoozeHounds/pubs/pubs/pubs%202/sir_john_cockle_xdj4t1.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377761/BoozeHounds/pubs/pubs/pubs%202/horeshoe_yuchpp.png
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377761/BoozeHounds/pubs/pubs/pubs%202/the_sevens_gdlduq.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377761/BoozeHounds/pubs/pubs/pubs%202/the_woodman_qhlh4p.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377760/BoozeHounds/pubs/pubs/pubs%202/the_beer_shop_c7yzfs.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377760/BoozeHounds/pubs/pubs/pubs%202/railway_tavern_bwftbk.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678377760/BoozeHounds/pubs/pubs/pubs%202/shenanigans_pq0mwk.jpg
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
    pub = Pub.new(name: line["name"], address: line["address_obj"]["street1"], postcode: line["address_obj"]["postalcode"], description: pub_description.sample, opening_time: opening.sample, closing_time: closing.sample, phone_number: line["location_id"], pool_table: [true, false].sample, non_alcoholic_drinks_selection: [true, false].sample, garden: [true, false].sample, parking: [true, false].sample, live_sport: [true, false].sample, wheelchair_accessible: [true, false].sample, food_menu: [true, false].sample)
    file = URI.open(pub_photos.sample)
    pub.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
    pub.save!
  end
end
puts "end"


# doggy = Dog.create(
#   name: "NES",
#   breed: "fluff",
#   proffession: "doggo",
#   age: 2
# )
