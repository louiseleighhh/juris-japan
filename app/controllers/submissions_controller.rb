class SubmissionsController < ApplicationController


  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
    @procedure = Procedure.find(params[:procedure_id])
  end

  def create
    @submission = Submission.new(submission_params)
    @user = current_user
    @submission.user = @user
    @procedure = Procedure.find(params[:procedure_id])
    @submission.procedure = @procedure
    @submission.status = 0
    if @submission.save
      redirect_to procedures_path
    else
      render :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:status)
  end
end
