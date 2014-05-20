require 'spec_helper'


describe Dog do
  it { should belong_to(:pedigree) }
  it { should have_many(:item_sales) }

  describe "#find_by_pedigree" do 
    before(:each) do
      FactoryGirl.create(:dog)
    end
    context "with right name" do
      it "found one dog" do
        dogs = Dog.find_by_pedigree("Gol") 
        expect(dogs.count).to eq(1)
      end          
    end  
    context "case insensitive" do
      it "found a dog" do
        dogs = Dog.find_by_pedigree("gOl")
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
