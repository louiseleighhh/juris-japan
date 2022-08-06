class ProceduresController < ApplicationController

  def index
    @procedures = Procedure.all
  end
  
  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      redirect_to procedures_path
    else
      render :new
    end
  end

  private

  def procedure_params
    params.require(:procedure).permit(:name)

  def show
    @procedure = Procedure.find(params[:id])
  end
end
