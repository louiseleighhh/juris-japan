class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:update, :edit]

  def index
    @consultations = Consultation.all
    # Consultation.where(user: current_user)
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def edit; end

  def update
    @lawfirm = Lawfirm.find(params[:lawfirm_id])
    @consultation.lawfirm = @lawfirm
    @consultation.update
    redirect_to consultation_path(@consultation)
  end

  private

  # def consultation_params
  #   params.require(:consultation).permit()
  # end

  def set_consultation
    @consultation = Consultation.find(params[:id])
  end
end
