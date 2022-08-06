class LawfirmsController < ApplicationController
  def new
    @lawfirm = Lawfirm.new
  end

  def create
    @lawfirm = Lawfirm.new(lawfirm_params)
    if @lawfirm.save
      redirect_to lawfirm_path
    else
      render :new
    end
  end

  private

  def lawfirm_params
    params.require(:lawfirm).permit(:name, :location)
  end
end
