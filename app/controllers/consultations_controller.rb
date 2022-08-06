class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
    # Consultation.where(user: current_user)
  end

  def show
    @consultation = Consultation.find(params[:id])
  end
end
