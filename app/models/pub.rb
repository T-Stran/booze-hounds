class Pub < ApplicationRecord
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews
  has_many :locals
  has_one_attached :photo
  has_many :favourites
  has_one :room
end
