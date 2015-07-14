require 'rails_helper'

RSpec.describe "stuffing_cakes/index", type: :view do
  before(:each) do
    assign(:stuffing_cakes, [
      StuffingCake.create!(
        :image => "Image",
        :description => "MyText",
        :price => "9.99"
      ),
      StuffingCake.create!(
        :image => "Image",
        :description => "MyText",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of stuffing_cakes" do
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
