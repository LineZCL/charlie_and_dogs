class Dog < ActiveRecord::Base
  belongs_to :pedigree  
  has_many :item_sales

  def self.find_by_pedigree(pedigree_name)    
    Dog.includes(:pedigree)
       .where(Pedigree.arel_table[:name].matches("%#{pedigree_name}%"))
       .references(:pedigrees)
  end
end
