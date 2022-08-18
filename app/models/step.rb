class Step < ApplicationRecord
  belongs_to :consultation
  has_many :items, dependent: :destroy
  validates :name, :instruction, presence: true
end
