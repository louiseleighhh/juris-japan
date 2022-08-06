class LawfirmsController < ApplicationController
  def index
    @lawfirms = Lawfirm.all
  end

  def show
    @lawfirm = Lawfirm.find(params[:id])
    @related_lawfirms = @lawfirm.find_related_tags
  end

  #def new
  #  @lawfirm = Lawfirm.new
  #end

  #def create
  #  @lawfirm = Lawfirm.new(lawfirm_params)
  #  if @lawfirm.save
  #    redirect_to lawfirm_path
  #  else
  #    render :new
  #  end
  #end

  #def tagged
  #  if params[:tag].present?
  #    @lawfirms = Lawfirm.tagged_with(params[:tag])
  #  else
  #    @lawfirms = Lawfirm.all
  #  end
  #end

  private

  def lawfirm_params
    params.require(:lawfirm).permit(:name, :location, :specialty [])
  end
end
