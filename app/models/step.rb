class Step < ApplicationRecord
  belongs_to :procedure
  has_many :submission
  validates :name, presence: true
end
