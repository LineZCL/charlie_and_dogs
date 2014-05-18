FactoryGirl.define do
  factory :dog do
    name 'Banana'
    age 4
    photo 'http://stylonica.com/wp-content/uploads/2014/03/Cute-Dog-Wallpaper.jpg'
    description 'Banana is cute'
    price 200.00
    association :pedigree
  end
end