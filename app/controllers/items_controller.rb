class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else

      render :new
     end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :category_id, :brand, :condition_id, :postageplayer_id, :shippingdate_id, :price, :introduction, :buyer_id, :prefecture_id, images_attributes: [:src])
  end  
end
