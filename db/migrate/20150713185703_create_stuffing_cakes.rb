class CreateStuffingCakes < ActiveRecord::Migration
  def change
    create_table :stuffing_cakes do |t|
      t.string :image
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
