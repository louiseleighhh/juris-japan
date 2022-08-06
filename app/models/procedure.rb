class Procedure < ApplicationRecord
  has_many :consultations
  has_many :steps, through: :consultations
  validates :name, presence: true
end
