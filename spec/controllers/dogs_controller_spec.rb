require 'spec_helper'
describe DogsController  do

  let(:valid_session) {{}}

  describe 'GET #index' do
    context 'without search param' do
      it 'assigns all dogs' do
        dog = FactoryGirl.create(:dog)
        get :index, {}, valid_session
        expect(assigns(:dogs)).to eq([dog])
      end
    end
    context 'with search param' do
      it 'assigns search result' do
        dog_result = FactoryGirl.create(:dog)
        dog = FactoryGirl.create(:dog, name: 'Bidu', pedigree: FactoryGirl.create(:pedigree, name: 'Schnauzer'))

        get :index, {search_pedigree: 'Gol'} , valid_session
        expect(assigns(:dogs)).to eq([dog_result])
      end
    end
  end
  describe 'POST #add_to_cart' do
    it 'create sale' do
      dog = FactoryGirl.create(:dog)
      post :add_to_cart, {new_item: dog.id}, valid_session
      expect(assigns(:sale)).not_to be_nil
    end

    it 'add item_sale' do
      dog = FactoryGirl.create(:dog)
      post :add_to_cart, {new_item: dog.id}, valid_session
      expect(assigns(:item_sale)).not_to be_nil
    end
  end
end