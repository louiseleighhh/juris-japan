class Lawfirm < ApplicationRecord
  belongs_to :user
  has_many :consultations
  has_many :reviews, dependent: :destroy
  acts_as_favoritable
  acts_as_taggable_on :tags
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, presence: true

  include PgSearch::Model
  pg_search_scope :full_search,
    against: [ :name, :address, :location ],
    associated_against: {
      tags: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
