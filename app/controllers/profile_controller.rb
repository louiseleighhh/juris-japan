class ProfileController < ApplicationController
  def profile
    @consultations = Consultation.where(user: current_user)
    @lawfirm = current_user.lawfirm
  end
end
