class Lawfirm < ApplicationRecord
  belongs_to :user
  has_many :consultations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  acts_as_favoritable
  acts_as_taggable_on :tags
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, :location, presence: true
  validates :description, length: { maximum: 250 }

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
