FactoryGirl.define do 
  factory :item_sale do
    quantity 1
    association :dog
    association :sale
  end
end