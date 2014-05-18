class SalesController < ApplicationController
  before_action :set_sale, only: [:show]

  def show 
    @items = ItemSale.where(sale_id: @sale.id)
  end

  def delete_item_from_cart 
    if ItemSale.exists? params[:item_id]
      ItemSale.find(params[:item_id]).destroy
    end
    redirect_to action: 'show', id: params[:sale_id]
  end

  private 
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:name)
    end
end