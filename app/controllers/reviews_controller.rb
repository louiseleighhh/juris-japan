class ReviewsController < ApplicationController
  def create
    @lawfirm = Lawfirm.find(params[:lawfirm_id])
    @review = Review.new(review_params)
    @review.lawfirm = @lawfirm

    respond_to do |format|
      if @review.save
        format.html { redirect_to lawfirm_path(@lawfirm) }
        format.json
      else
        format.html { render "lawfirms/show" }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
