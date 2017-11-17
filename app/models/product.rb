class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost_in_usa_cents, :presence => true 
  validates :country_of_origin, :presence => true
end
