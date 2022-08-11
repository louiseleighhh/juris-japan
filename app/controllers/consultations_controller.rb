class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:update, :edit, :show]

  def index
    @consultations = Consultation.where(user: current_user)
  end

  def new
    @consultation = Consultation.new
    @procedure = Procedure.find(params[:procedure_id])
  end

  def create
    @consultation = Consultation.new
    @user = current_user
    @consultation.user = @user
    @procedure = Procedure.find(params[:procedure_id])
    @consultation.procedure = @procedure
    if @consultation.save
      redirect_to consultations_path
    else
      render :new
    end
  end

  def show; end

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
