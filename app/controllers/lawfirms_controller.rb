class LawfirmsController < ApplicationController
  def index
    @lawfirms = Lawfirm.all
  end

  def show
    @lawfirm = Lawfirm.find(params[:id])
  end
end
