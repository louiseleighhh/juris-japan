class Procedure < ApplicationRecord
  has_many :consultations
  validates :name, presence: true
end
