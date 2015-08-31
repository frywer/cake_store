class AddCakeCategoryToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :cake_category, index: true
    add_foreign_key :products, :cake_categories

  end
end
