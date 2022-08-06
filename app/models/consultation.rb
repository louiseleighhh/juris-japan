class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :procedure
  belongs_to :lawfirm, optional: true
  has_many :messages, dependent: :destroy
end
