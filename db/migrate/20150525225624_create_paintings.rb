class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.belongs_to :gallery, index: true

      t.timestamps null: false
    end
    add_foreign_key :paintings, :galleries
  end
end
