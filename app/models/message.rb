class Message < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
  validates :content, presence: true
end
