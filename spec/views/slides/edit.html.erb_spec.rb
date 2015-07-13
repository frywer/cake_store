require 'rails_helper'

RSpec.describe "slides/edit", type: :view do
  before(:each) do
    @slide = assign(:slide, Slide.create!(
      :title => "MyString",
      :slider_image => "MyString",
      :slider_content => "MyText"
    ))
  end

  it "renders the edit slide form" do
    render

    assert_select "form[action=?][method=?]", slide_path(@slide), "post" do

      assert_select "input#slide_title[name=?]", "slide[title]"

      assert_select "input#slide_slider_image[name=?]", "slide[slider_image]"

      assert_select "textarea#slide_slider_content[name=?]", "slide[slider_content]"
    end
  end
end
