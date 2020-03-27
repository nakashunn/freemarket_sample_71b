class ItemsController < ApplicationController
  def new
    @item = Item.new
    @product = Categorie.where(id: 14..19)
    @products = Categorie.where(id: 29..31)
    @parent = Categorie.where(id: 1..13)
  end
  
  def show
    @item = Item.find_by(id: params[:id])
    @categorie = Categorie.find_by(id: @item.category_id)
  end
  
  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      # redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def item_params
    params.require(:item)
            .permit( :name, :text, :condition, :price, :trading_status, :category_id)
  end

end