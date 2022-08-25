class Review < ApplicationRecord
  belongs_to :lawfirm
  validates :content, length: { minimum: 20 }
  validates :rating, presence: true
end
