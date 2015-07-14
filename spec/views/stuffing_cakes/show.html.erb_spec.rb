require 'rails_helper'

RSpec.describe "stuffing_cakes/show", type: :view do
  before(:each) do
    @stuffing_cake = assign(:stuffing_cake, StuffingCake.create!(
      :image => "Image",
      :description => "MyText",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
  end
end
