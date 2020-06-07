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
      redirect_to items_path
    else
      redirect_to action: "new"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

end

private
  def item_params
    params.require(:item).permit(:name, :purchase, :stock, :expiration).merge(user_id: current_user.id)
  end
