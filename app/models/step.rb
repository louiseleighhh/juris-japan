class Step < ApplicationRecord
  belongs_to :consultation
  has_many_attached :photos
  validates :name, :instruction, presence: true
end
