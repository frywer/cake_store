require 'rails_helper'

RSpec.describe "slides/index", type: :view do
  before(:each) do
    assign(:slides, [
      Slide.create!(
        :title => "Title",
        :slider_image => "Slider Image",
        :slider_content => "MyText"
      ),
      Slide.create!(
        :title => "Title",
        :slider_image => "Slider Image",
        :slider_content => "MyText"
      )
    ])
  end

  it "renders a list of slides" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Slider Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
