class Local < ApplicationRecord
  belongs_to :pub
  belongs_to :dog, dependent: :destroy
  has_one_attached :photo

end
