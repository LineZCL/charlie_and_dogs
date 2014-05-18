require 'spec_helper'


describe Dog do
  it { should belong_to(:pedigree) }
  it { should have_many(:item_sales) }

  describe "#find_by_pedigree" do 
    context "with right name" do

      before(:each) do
        FactoryGirl.create(:dog)
      end

      it "found one dog" do
        dogs = Dog.find_by_pedigree("Gol") 
        expect(dogs.count).to eq(1)
      end          
    end  

    context "with wrong name" do
      it "didnt found dog" do
        expect(Dog.find_by_pedigree("Labrador").count).to eq(0)
      end
    end  
  end  
end
