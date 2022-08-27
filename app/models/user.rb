class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :consultations, dependent: :destroy
  has_many :consultations_as_lawyer, through: :lawfirm, source: :consultations
  has_many :messages, dependent: :destroy
  has_one :lawfirm, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 6..20 }
  acts_as_favoritor

  def lawyer?
    self.lawfirm.present?
  end
end
