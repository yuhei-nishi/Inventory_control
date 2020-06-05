class ItemsController < ApplicationController
  def index
    @items = Item.order("expiration")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to items_path, notice: '食品登録しました'
    else
      flash[:alert] = '食品登録できませんでした'
      redirect_to action: "new"
    end
  end
end

private
  def item_params
    params.require(:item).permit(:name, :purchase, :stock, :expiration)
  end
