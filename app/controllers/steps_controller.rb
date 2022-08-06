class StepsController < ApplicationController

  def index
    @steps = Step.all
  end
  
  def new
    @step = Step.new
    @procedure = Procedure.find(params[:procedure_id])
  end

  def create
    @step = Step.new(step_params)
    @procedure = Procedure.find(params[:procedure_id])
    @submission.procedure = @procedure
    if @submission.save
      redirect_to procedures_path
    else
      render :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:name)

  def show
    @step = Step.find(params[:id])
  end
end
