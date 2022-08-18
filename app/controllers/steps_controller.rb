class StepsController < ApplicationController
  #def index
  #  @steps = Step.all
  #end

  #def show
  #  @step = Step.find(params[:id])
  #end

  # def new
  #   @step = Step.new
  # end

  #def create
  #  @step = Step.new(step_params)
  #  @consultation = Consultation.find(params[:consultation_id])
  #  @step.consultation = @consultation
  #  @step.status = 0
  #  if @step.save
  #    redirect_to step_path(@step)
  #    #Again not really sure where we should redirect
  #  else
  #    render :new
  #  end
  #end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    @step.update(step_params)
    @consultation = @step.consultation
    redirect_to consultation_path(@consultation)
  end

  private

  def step_params
    params.require(:step).permit(:name, :status, :instruction)
  end
end
