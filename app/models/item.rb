class Item < ApplicationRecord
  belongs_to :step
  has_many_attached :photos
  enum status: { unchecked: 0, checked: 1 }
  validates :name, presence: true
end
