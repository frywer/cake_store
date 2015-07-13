class Slide < ActiveRecord::Base
  mount_uploader :slider_image, SlideImageUploader
end
