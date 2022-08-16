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

  private

  def item_params
    params.require(:item).permit(:status, photos: [])
  end
end
