class Step < ApplicationRecord
  belongs_to :consultation
  validates :name, :instruction, presence: true
end
