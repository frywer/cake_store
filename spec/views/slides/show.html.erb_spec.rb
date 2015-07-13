require 'rails_helper'

RSpec.describe "slides/show", type: :view do
  before(:each) do
    @slide = assign(:slide, Slide.create!(
      :title => "Title",
      :slider_image => "Slider Image",
      :slider_content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Slider Image/)
    expect(rendered).to match(/MyText/)
  end
end
