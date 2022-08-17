class ProfileController < ApplicationController
  def profile
    @consultations = Consultation.where(user: current_user)
  end
end
