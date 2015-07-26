class Product < ActiveRecord::Base

  belongs_to :cake_category
  has_many :line_items
  has_many :orders, through: :line_items
  #mount_uploader :product_image, ImageUploader

  #has_attached_file :product_image,
   #                 :storage => :dropbox,
    #                :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  #validates_attachment :product_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  #validates_attachment_file_name :product_image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  #do_not_validate_attachment_file_type :product_image



  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :product_image, styles: {
                                      thumb: '100x100>',
                                      square: '200x200#',
                                      medium: '300x300>'
                                  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :product_image, :content_type => /\Aimage\/.*\Z/


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