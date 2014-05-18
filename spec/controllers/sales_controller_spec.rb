require 'spec_helper'
describe SalesController do
  let(:valid_session) {{}}
  
  describe 'GET #show' do
    context 'with a sale' do
      it 'presents all items' do
        sale = FactoryGirl.create(:sale)
        item1 = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog))
        item2 = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog, name:'Pepo'))

        get :show, {id: sale.id} , valid_session
        expect(assigns(:items).count).to eq(2)  
      end
    end
  end

  describe 'DELETE #delete_item_from_cart' do
    it 'delete the requested item' do
      sale = FactoryGirl.create(:sale)
      item1 = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog))
      item2 = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog, name:'Pepo'))
      expect do
        delete :delete_item_from_cart, { item_id: item1.id, sale_id: sale.id }, valid_session
      end.to change(ItemSale, :count).by(-1)
    end

    it 'delete non-existent item' do
      sale = FactoryGirl.create(:sale)
      item1 = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog))
      item2 = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog, name:'Pepo'))
      expect do
        delete :delete_item_from_cart, { item_id: 0, sale_id: sale.id}, valid_session
      end.to change(ItemSale, :count).by(0)
    end
  end

  describe 'POST #checkout' do
    it 'add client' do
      client = Client.new(name: 'Aline', email: 'aline@teste.com.br', cpf: '36957896854', address: 'Av Paulista, 458')
      sale = FactoryGirl.create(:sale)
      expect do
        post :checkout, { client: client.attributes, sale_id: sale.id }, valid_session
      end.to change(Client, :count).by(+1)
    end
    it 'sale has a client' do
      client = Client.new(name: 'Aline', email: 'aline@teste.com.br', cpf: '36957896854', address: 'Av Paulista, 458')
      sale = FactoryGirl.create(:sale)
      post :checkout, { client: client.attributes, sale_id: sale.id }, valid_session
      expect(sale.client_id).to eq(client.id)
    end

  end

end                                                                                       