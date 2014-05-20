require 'spec_helper'

describe Client do
  it { should have_many(:sales) }

  describe 'Validate client model'do 
    it "should have valid client" do
        FactoryGirl.build(:client).should be_valid
    end
    it "should require a name" do
        FactoryGirl.build(:client, name: "").should_not be_valid
    end
    it "should require a cpf" do
        FactoryGirl.build(:client, cpf: "").should_not be_valid
    end
    it "should require a address" do
        FactoryGirl.build(:client, address: "").should_not be_valid
    end
    it "should require a email" do
        FactoryGirl.build(:client, email: "").should_not be_valid
    end
    it "email format incorrect" do
        FactoryGirl.build(:client, email: "aline").should_not be_valid
    end
  end

end

