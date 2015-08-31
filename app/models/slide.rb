class Slide < ActiveRecord::Base
  #mount_uploader :slider_image, SlideImageUploader
  has_attached_file :slider_image,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates_attachment :slider_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_file_name :slider_image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  do_not_validate_attachment_file_type :slider_image
end
