class Dog < ActiveRecord::Base
  belongs_to :pedigree  

  def self.find_by_pedigree(pedigree_name)
    str = "pedigrees.name LIKE '%#{pedigree_name}%'"
    Dog.includes(:pedigree).where("pedigrees.name LIKE '%#{pedigree_name}%'").references(:pedigrees)
  end
end
