require 'spec_helper'

describe ItemSale do
  it { should belong_to(:dog) }
  it { should belong_to(:sale) }

  describe 'updates total' do
    context 'after save' do 
      it 'sum dog price to total' do 
        sale = FactoryGirl.create(:sale)
        item = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog, price: 500))
        expect(item.sale.total_price.to_f).to eq(500)
      end
      it 'change_quantity' do 
        sale = FactoryGirl.create(:sale)
        item = FactoryGirl.create(:item_sale, sale: sale, dog: FactoryGirl.create(:dog, price: 500))
        item.update_attributes(quantity: item.quantity + 1)
        expect(item.sale.total_price.to_f).to eq(1000)
      end
    end
  end
end
