class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :procedure
  belongs_to :lawfirm, optional: true
  has_many :messages, dependent: :destroy
  has_many :steps, dependent: :destroy

  # after_create :create_steps

  private

  def create_steps
    self.procedure.create_steps(self.id)
  end
end
