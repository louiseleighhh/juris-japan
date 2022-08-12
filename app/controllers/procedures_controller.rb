class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end

  def show
    @procedure = Procedure.find(params[:id])
    @consultation = Consultation.new
  end

  #def new
  #  @procedure = Procedure.new
  #end

  #def create
  #  @procedure = Procedure.new(procedure_params)
  #  if @procedure.save
  #    redirect_to procedures_path
  #  else
  #    render :new
  #  end
  #end

  #def edit
  #  @procedure = Procedure.find(params[:id])
  #end

  #def update
  #  @procedure = Procedure.find(params[:id])
  #  @procedure.update(procedure_params)
  #  redirect_to procedure_path(@procedure)
    # or maybe to procedures_path ?
    # Not sure if you prefer to refirect to procedures_path

  #end

  private

  def procedure_params
    params.require(:procedure).permit(:name)
  end
end
