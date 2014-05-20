class Client < ActiveRecord::Base
  has_many :sales

  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :cpf, presence: true
  validates :address, presence: true
end
