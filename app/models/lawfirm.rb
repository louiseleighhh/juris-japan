class Lawfirm < ApplicationRecord
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :address, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  acts_as_taggable_on :tags
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, presence: true
end
