class Product < ActiveRecord::Base

  belongs_to :cake_category
  has_many :line_items
  has_many :orders, through: :line_items
  mount_uploader :product_image, ImageUploader

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description,  presence: {message: 'Поле должно быть заполнено!'}
  #validates :price, numericality: {greater_than_or_equal_to: 0.01, message: 'Цена отсутствует!'}
  validates :title, uniqueness: {message: 'Такой товар уже существует!'}


  def self.latest
    Product.order(:updated_at).last
  end

  private
  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
       true
    else
      errors.add(:base, 'существуют товарные позиции')
      false
    end
  end
end