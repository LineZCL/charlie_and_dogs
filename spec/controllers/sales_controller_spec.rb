require 'spec_helper'
describe SalesController do
  let(:valid_session) {{}}
  
  describe 'GET show' do
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

  describe 'DELETE delete_item_from_cart' do
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
end                                                                                       