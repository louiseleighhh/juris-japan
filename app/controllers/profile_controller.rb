class ProfileController < ApplicationController
  def profile
    @consultations = Consultation.where(user: current_user)
    @lawfirm = current_user.lawfirm
    @favorite_lawfirms = current_user.favorited_by_type('Lawfirm')
  end
end
