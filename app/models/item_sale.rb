class ItemSale < ActiveRecord::Base
  belongs_to :sale
  belongs_to :dog

  after_destroy :sub_price_from_sale
  after_save :sum_price_to_sale

  def sum_price_to_sale
    if self.quantity_changed?
      update_sale_total(self.dog.price)
    end  
  end

  def sub_price_from_sale
    update_sale_total(-self.dog.price)
  end

  def update_sale_total(price)
    self.sale.total_price += price
    self.sale.save
  end
end
