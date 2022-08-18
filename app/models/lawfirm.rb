class Lawfirm < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, presence: true
end
