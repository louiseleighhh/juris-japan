class Lawfirm < ApplicationRecord
  belongs_to :user
  has_many :consultations
  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :address, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  has_many :reviews, dependent: :destroy
  acts_as_taggable_on :tags
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, presence: true
  acts_as_favoritable
end
