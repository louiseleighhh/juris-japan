class Step < ApplicationRecord
  belongs_to :consultation
  has_many :items, dependent: :destroy
  validates :name, :instruction, presence: true
  def completed?
    items.all? do |item|
      item.checked?
    end
  end
end
