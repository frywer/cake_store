class StuffingCake < ActiveRecord::Base
  mount_uploader :image, ImageStuffingCakesUploader
end
