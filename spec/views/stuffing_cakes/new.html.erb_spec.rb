require 'rails_helper'

RSpec.describe "stuffing_cakes/new", type: :view do
  before(:each) do
    assign(:stuffing_cake, StuffingCake.new(
      :image => "MyString",
      :description => "MyText",
      :price => "9.99"
    ))
  end

  it "renders new stuffing_cake form" do
    render

    assert_select "form[action=?][method=?]", stuffing_cakes_path, "post" do

      assert_select "input#stuffing_cake_image[name=?]", "stuffing_cake[image]"

      assert_select "textarea#stuffing_cake_description[name=?]", "stuffing_cake[description]"

      assert_select "input#stuffing_cake_price[name=?]", "stuffing_cake[price]"
    end
  end
end
