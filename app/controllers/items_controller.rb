class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path, notice: '出品完了しました'
    else
      flash[:alert] = '出品できませんでした'
      redirect_to action: "new"
    end
  end
end

private
  def item_params
    params.require(:item).permit(:name, :purchase, :stock, :expiration)
  end
