class Ingredient < ActiveRecord::Base
  has_many :sandwich_ingredient
  has_many :sandwichs, :through => :sandwich_ingredient
end
