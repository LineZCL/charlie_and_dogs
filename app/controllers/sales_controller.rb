class SalesController < ApplicationController

  def show 
    @sale = Sale.find(params[:id])
    @items = ItemSale.where(sale_id: @sale.id)
    @client = Client.new

  end

  def delete_item_from_cart 
    if ItemSale.exists? params[:item_id]
      ItemSale.find(params[:item_id]).destroy
    end
    redirect_to action: 'show', id: params[:sale_id]
  end

  def checkout
     @client = Client.new(client_params)

    if @client.save
      sale = Sale.find(params[:sale_id])
      sale.update_attributes(client_id: @client.id)
      redirect_to action: 'index', controller: 'dogs', notice: 'Sale Succesful'
      
    else
       render action: 'show', id: params[:sale_id]
    end      
  end

  private 
    def sale_params
      params.require(:sale).permit(:sale_id, :item_id)
    end
    def client_params
      params.require(:client).permit(:name, :email, :cpf, :address)
    end
end