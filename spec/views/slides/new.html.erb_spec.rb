require 'rails_helper'

RSpec.describe "slides/new", type: :view do
  before(:each) do
    assign(:slide, Slide.new(
      :title => "MyString",
      :slider_image => "MyString",
      :slider_content => "MyText"
    ))
  end

  it "renders new slide form" do
    render

    assert_select "form[action=?][method=?]", slides_path, "post" do

      assert_select "input#slide_title[name=?]", "slide[title]"

      assert_select "input#slide_slider_image[name=?]", "slide[slider_image]"

      assert_select "textarea#slide_slider_content[name=?]", "slide[slider_content]"
    end
  end
end
