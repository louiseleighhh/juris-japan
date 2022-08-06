class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
    # Consultation.where(user: current_user)
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

  def show
    @consultation = Consultation.find(params[:id])
  end
end
