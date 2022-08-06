class Step < ApplicationRecord
  belongs_to :procedure
  has_many :submissions
  validates :name, presence: true
end
