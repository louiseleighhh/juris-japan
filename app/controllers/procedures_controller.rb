class ProceduresController < ApplicationController

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
  end
end
