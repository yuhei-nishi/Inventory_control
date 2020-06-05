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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path, notice: '食品編集しました'
  end

end

private
  def item_params
    params.require(:item).permit(:name, :purchase, :stock, :expiration)
  end
