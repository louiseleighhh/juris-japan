class Chatroom < ApplicationRecord
  belongs_to :consultation
  has_many :messages
end
