require 'rails_helper'

RSpec.describe "cake_categories/new", type: :view do
  before(:each) do
    assign(:cake_category, CakeCategory.new(
      :title => "MyString"
    ))
  end

  it "renders new cake_category form" do
    render

    assert_select "form[action=?][method=?]", cake_categories_path, "post" do

      assert_select "input#cake_category_title[name=?]", "cake_category[title]"
    end
  end
end
