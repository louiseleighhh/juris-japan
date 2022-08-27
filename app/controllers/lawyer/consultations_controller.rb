class Lawyer::ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.includes(:lawter).where(lawfirms: [ user: current_user])
  end
end
