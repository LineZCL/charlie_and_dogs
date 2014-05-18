class Sale < ActiveRecord::Base
  belongs_to :client
  has_many :item_sales
end
