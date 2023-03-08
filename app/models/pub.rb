class Pub < ApplicationRecord
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews
end
