class AddColumnToCakeCategory < ActiveRecord::Migration
  def change
    add_reference :cake_categories, :category, index: true
    add_foreign_key :cake_categories, :categories
  end
end
