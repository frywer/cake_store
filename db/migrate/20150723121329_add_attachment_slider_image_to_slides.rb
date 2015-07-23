class AddAttachmentSliderImageToSlides < ActiveRecord::Migration
  def self.up
    change_table :slides do |t|
      t.attachment :slider_image
    end
  end

  def self.down
    remove_attachment :slides, :slider_image
  end
end
