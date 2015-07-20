class CakeCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products, inverse_of: :cake_category
end
