class Local < ApplicationRecord
  belongs_to :pub
  belongs_to :dog
  has_one_attached :photo
end
