class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @consultation = @item.step.consultation
    @item.checked! if @item.photos.attached?
    redirect_to consultation_path(@consultation)
  end

  def delete_photo_attachment
    @item = Item.find(params[:id])
    @photo = @item.photos.find_by(blob_id: params[:photo])
    @photo.purge
    @consultation = @item.step.consultation
    @item.unchecked! unless @item.photos.attached?
    redirect_to consultation_path(@consultation)
  end

  private

  def item_params
    params.require(:item).permit(:status, photos: [])
  end
end
