class LawfirmsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        lawfirms.name @@ :query \
        OR lawfirms.location @@ :query \
        OR lawfirms.address @@ :query \
      "
      @lawfirms = Lawfirm.where(sql_query, query: "%#{params[:query]}%")
    else
      @lawfirms = Lawfirm.all
    end
    @markers = @lawfirms.geocoded.map do |lawfirm|
      {
        lat: lawfirm.latitude,
        lng: lawfirm.longitude,
        info_window: render_to_string(partial: "info_window", locals: { lawfirm: lawfirm })
        # image_url: helpers.asset_url("REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS")
      }
    end
  end

  def show
    @lawfirm = Lawfirm.find(params[:id])
    @related_lawfirms = @lawfirm.find_related_tags
    @markers =
      [{
        lat: @lawfirm.latitude,
        lng: @lawfirm.longitude,
        info_window: render_to_string(partial: "info_window", locals: { lawfirm: @lawfirm })
        # image_url: helpers.asset_url("REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS")
      }]
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
    params.require(:lawfirm).permit(:name, :address, :tag_list [])
  end
end
