class AddIngredientsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ingridients, :text
  end
end
