class Lawfirm < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  validates :name, :location, presence: true
end
