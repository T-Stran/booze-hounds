class Dog < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 1 }
  validates :breed, presence: true, length: { minimum: 1 }
  validates :proffession, presence: true, length: { minimum: 1 }
  validates :age, presence: true
end
