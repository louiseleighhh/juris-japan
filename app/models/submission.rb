class Submission < ApplicationRecord
  belongs_to :step
  belongs_to :user
  enum status: { pending: 0, uploaded: 1, accepted: 2, rejected: 3 }
  validates :status, presence: true
end
