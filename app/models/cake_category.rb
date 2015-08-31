class CakeCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products, inverse_of: :cake_category
  validates :category_id, presence: {message: 'Выберите категорию!!!'}
  validates :title, presence: {message: 'Поле должно быть заполнено!!!'}
end
