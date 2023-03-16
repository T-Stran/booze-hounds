# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
# require "json"
require "csv"

require 'uri'
require 'net/http'
require 'openssl'

pub_photos = %w[
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810407/Booze/the_temple_bar_t5aalp_cpkybx.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810407/Booze/the_old_bank_bwlxik_vm6v54.png
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810407/Booze/the_Stara_lwhjl1_tdzhcz.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/the_ship_jmuqux_avl7pv.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810407/Booze/the_star_mib1pf_jgv3ko.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/the_netherton_mfmv3r_wdhwhw.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/the_old_toll_bar_efhzye_cfhxzn.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/the_castle_inn_ew5yyo_unkhgf.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/sherlock_holmes_jgyhle_dmohbo.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/angel_and_crown_npxdyp_drpk4x.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/nags_head_sigyrm_r1eyln.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/gus_o-conners_yndvn5_htqpl5.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810406/Booze/haggon_horses_yxznsc_pfh5rh.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810407/Booze/the_temple_bar_t5aalp_cpkybx.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/the_light_dragoon_yzyvgq.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959124/Booze/Pubs/Irish_pub_dghlu4.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959124/Booze/Pubs/Lauders_gxjkmj.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959124/Booze/Pubs/Lord_wargrave_djyaax.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/the_light_dragoon_yzyvgq.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/Chruchill_arms_jcpsia.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/the_cambridge_muart2.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/The_shrelock_holmes_kr6cyi.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/the_camel_suobc2.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678810407/Booze/the_Stara_lwhjl1_tdzhcz.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/The_Spread_Eagle_xfzgul.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/Chruchill_arms_jcpsia.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/The_old_bell_xvlszh.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959126/Booze/Pubs/The-Red-Lion-Mayfair-SW1_dgkaov.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959125/Booze/Pubs/The_White_Swan_ljh96b.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959126/Booze/Pubs/The_Wilmington_x4up70.webp
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959126/Booze/Pubs/The_two_sportsmen_mjzceg.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959126/Booze/Pubs/The-Crown-and-Anchor_jynn0p.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959126/Booze/Pubs/ye_old_watling_q8ouzc.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959126/Booze/Pubs/The_windmill_xb7xgl.jpg
  https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678959127/Booze/Pubs/The-Red-Lion-and-Pineapple-Pub-in-Acton-Photo-Google-Maps_gae2rf.png
]

opening = [9, 10, 11, 12, 13]
closing = [21, 22, 23]
pub_description = ["Fashionably updated Victorian pub with wood floors, big windows and rotating list of unusual beers.",
                   "The perfect place to eat and enjoy freshly brewed, hyper local, award-winning craft beers.",
                   "Cool, vibrant bar on 4 floors with lounges, sofas and roof terrace, serving burgers and pizza.",
                   "Traditional, compact corner pub with bench and stool seating, stripped floors and real ales on tap.",
                   "High-ceilinged pub with fireplace and Chesterfield sofas, plus pizza menu.",
                   "An adventurous pub food menu in a relaxed setting with stripped wooden tables and a fireplace.",
                   "Traditional, cosy pub in the backstreets with original frontage and a rotating choice of real ales.",
                   "Relaxed pub with a warm vibe pouring craft beer & gin drinks amid dark-wood decor & a vintage bar.",
                   "Victorian pub namechecked in the rhyme Pop Goes the Weasel, with courtyard garden and weekly quiz."]

puts "Destroying everything"
RoomMessage.destroy_all
Review.destroy_all
Local.destroy_all
Query.destroy_all
Dog.destroy_all
User.destroy_all
Pub.destroy_all
puts "Everything destroyed"
puts "Generating DB"


filepath = Rails.root.join('db', 'pubs.csv')

CSV.foreach(filepath) do |row|
  pub = Pub.new(name: row[1], address: row[2], postcode: row[3], description: pub_description.sample,
                opening_time: opening.sample, closing_time: closing.sample,
                pool_table: [true, false].sample, non_alcoholic_drinks_selection: [true, false].sample,
                garden: [true, false].sample, parking: [true, false].sample, live_sport: [true, false].sample,
                wheelchair_accessible: [true, false].sample, food_menu: [true, false].sample,
                phone_number: "07#{rand(10**9)}")
  file = URI.open(pub_photos.sample)
  pub.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
  pub.save!
end



puts "Pubs created"

dave = User.create!(
  email: "dave@dave.com",
  password: "daveisking",
  username: "KingDave"
)

julio = User.create!(
  email: "julio@julio.com",
  password: "julio123",
  username: "JulioCoolio"
)

atticus = User.create!(
  email: "atticus@atticus.com",
  password: "att456",
  username: "Attaboy"
)

stella = User.create(
  email: "stella@stella.com",
  password: "stelltastic",
  username: "AStellaADay"
)

lauren = User.create(
  email: "lauren@lauren.com",
  password: "laurenwhite",
  username: "LDog"
)

samantha = User.create(
  email: "samantha@samantha.com",
  password: "samsam",
  username: "Samanth247"
)

puts "Users created"

# DOG SEED

dog_ages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

dog_proffessions = ["Professional sausage thief", "Amature sausage thief", "Doctor", "Lawyer", "Hoover", "Digger",
                    "Lawyer", "Burglar alarm", "Swimmer", "Sniffer"]


oz = Dog.new(
  name: "Oz",
  breed: "German Shepherd",
  age: 8,
  proffession: dog_proffessions.sample,
  user_id: dave.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375277/BoozeHounds/German_shepherd_vpkdw7.jpg")
oz.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
oz.save!

dingo = Dog.new(
  name: "Dingo",
  breed: "Labrador",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: atticus.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375278/BoozeHounds/labrador_bc8tm2.jpg")
dingo.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
dingo.save!

baz = Dog.new(
  name: "Baz",
  breed: "Golden Retriever",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: lauren.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375278/BoozeHounds/Golden_retriever_h08odv.jpg")
baz.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
baz.save!

joey = Dog.new(
  name: "Joey",
  breed: "Bulldog",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: dave.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375278/BoozeHounds/bulldog_lkqgbm.webp")
joey.photo.attach(io: file, filename: "nes.webp", content_type: "image/webp")
joey.save!

hogan = Dog.new(
  name: "Hogan",
  breed: "French Bulldog",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: lauren.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375277/BoozeHounds/french_bulldog_qvqpsf.webp")
hogan.photo.attach(io: file, filename: "nes.webp", content_type: "image/webp")
hogan.save!

bunji = Dog.new(
  name: "Bunji",
  breed: "Chihuahua",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: samantha.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375278/BoozeHounds/chihuahua_sgib8o.webp")
bunji.photo.attach(io: file, filename: "nes.webp", content_type: "image/webp")
bunji.save!

dulili = Dog.new(
  name: "Dulili",
  breed: "Husky",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: julio.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375278/BoozeHounds/husky_vgowpp.jpg")
dulili.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
dulili.save!

nunkeri = Dog.new(
  name: "Nunkeri",
  breed: "Alaskan Malamute",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: julio.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375277/BoozeHounds/alaskan_malamute_teovtp.jpg")
nunkeri.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
nunkeri.save!

sheila = Dog.new(
  name: "Sheila",
  breed: "Poodle",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: stella.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375278/BoozeHounds/poodle_alzevg.webp")
sheila.photo.attach(io: file, filename: "nes.webp", content_type: "image/webp")
sheila.save!

bindi = Dog.new(
  name: "Bindi",
  breed: "Border Collie",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: samantha.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375277/BoozeHounds/border_collie_uh44y6.jpg")
bindi.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
bindi.save!

bonzer = Dog.new(
  name: "Bonzer",
  breed: "Yorkshire Terrier",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: stella.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375278/BoozeHounds/yorkie_n5gg3r.jpg")
bonzer.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
bonzer.save!

roo = Dog.new(
  name: "Roo",
  breed: "Airedale Terrier",
  age: dog_ages.sample,
  proffession: dog_proffessions.sample,
  user_id: atticus.id
)
file = URI.open("https://res.cloudinary.com/dfi8ju7lr/image/upload/v1678375277/BoozeHounds/airedale_terrier_jz7lh9.jpg")
roo.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")
roo.save!

puts "Dogs created"

puts "DB created"
