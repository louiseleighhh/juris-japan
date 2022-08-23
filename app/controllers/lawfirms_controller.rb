class LawfirmsController < ApplicationController
  before_action :set_lawfirm, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present? && ["immigration", "corporate", "family", "intellectual", "property", "law"].include?(params[:query])
      @lawfirms = Lawfirm.tagged_with(params[:tag])
    elsif params[:query].present?
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
    @related_lawfirms = @lawfirm.find_related_tags
    @markers =
      [{
        lat: @lawfirm.latitude,
        lng: @lawfirm.longitude,
        info_window: render_to_string(partial: "info_window", locals: { lawfirm: @lawfirm })
        # image_url: helpers.asset_url("REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS")
      }]
    @review = Review.new
  end

  def new
    @lawfirm = Lawfirm.new
  end

  def create
    @lawfirm = Lawfirm.new(lawfirm_params)
    @lawfirm.user = current_user
    # @lawfirm.location = current_user.location
    if @lawfirm.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def tagged
    if Lawfirm.tag_list.include?(params[:query])
      @lawfirms = Lawfirm.tagged_with(params[:tag])
    else
      @lawfirms = Lawfirm.all
    end
  end

  def edit; end

  def update
    @lawfirm.update(lawfirm_params)
    redirect_to profile_path
  end

  def destroy
    @lawfirm.destroy
    redirect_to profile_path
  end

  private

  def lawfirm_params
    params.require(:lawfirm).permit(:name, :address, tag_list: [])
  end

  def set_lawfirm
    @lawfirm = Lawfirm.find(params[:id])
  end
end
