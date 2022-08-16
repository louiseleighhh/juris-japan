class Step < ApplicationRecord
  belongs_to :consultation
  has_many :items
  validates :name, :instruction, presence: true
end
