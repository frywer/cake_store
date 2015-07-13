class CakeCategory < ActiveRecord::Base
  has_many :products, inverse_of: :cake_category
end
