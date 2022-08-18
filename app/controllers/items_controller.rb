class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item)

  end

  def delete_photo_attachment
    @item = Item.find(params[:id])
    @photo = @item.photos.find_by(blob_id: params[:photo])
    @photo.purge
    @consultation = @item.consultation
    redirect_to consultation_path(@consultation)
  end

  private

  def item_params
    params.require(:item).permit(:status, photos: [])
  end
end
