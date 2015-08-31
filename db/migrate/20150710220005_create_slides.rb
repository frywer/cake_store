class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.string :slider_image
      t.text :slider_content

      t.timestamps null: false
    end
  end
end
