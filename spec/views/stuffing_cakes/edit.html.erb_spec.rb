require 'rails_helper'

RSpec.describe "stuffing_cakes/edit", type: :view do
  before(:each) do
    @stuffing_cake = assign(:stuffing_cake, StuffingCake.create!(
      :image => "MyString",
      :description => "MyText",
      :price => "9.99"
    ))
  end

  it "renders the edit stuffing_cake form" do
    render

    assert_select "form[action=?][method=?]", stuffing_cake_path(@stuffing_cake), "post" do

      assert_select "input#stuffing_cake_image[name=?]", "stuffing_cake[image]"

      assert_select "textarea#stuffing_cake_description[name=?]", "stuffing_cake[description]"

      assert_select "input#stuffing_cake_price[name=?]", "stuffing_cake[price]"
    end
  end
end
