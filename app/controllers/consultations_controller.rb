class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:update, :edit, :show, :destroy]

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

  def show
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    @markdown = Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def edit; end

  def update
    @lawfirm = Lawfirm.find(params[:lawfirm_id])
    @consultation.lawfirm = @lawfirm
    @consultation.update
    redirect_to consultation_path(@consultation)
  end

  def destroy
    @consultation.destroy
    redirect_to consultations_path
  end

  private

  # def consultation_params
  #   params.require(:consultation).permit()
  # end

  def set_consultation
    @consultation = Consultation.includes(steps: :items).find(params[:id])
  end
end
