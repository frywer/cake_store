class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: {message: 'Поле должно быть заполнено!'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01, message: 'Цена отсутствует!'}
  validates :title, uniqueness: {message: 'Такой товар уже существует!'}
  validates :image_url, allow_blank: true, format: {
                          with: %r{\.(gif|jpg|png)\Z}i,
                          message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
                      }

  def self.latest
    Product.order(:updated_at).last
  end
end