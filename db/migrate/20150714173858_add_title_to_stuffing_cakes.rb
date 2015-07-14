class AddTitleToStuffingCakes < ActiveRecord::Migration
  def change
    add_column :stuffing_cakes, :title, :string
  end
end
