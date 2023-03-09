class Favourite < ApplicationRecord
  belongs_to :user
  has_many :pubs
end
