require 'rails_helper'

RSpec.describe "cake_categories/edit", type: :view do
  before(:each) do
    @cake_category = assign(:cake_category, CakeCategory.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit cake_category form" do
    render

    assert_select "form[action=?][method=?]", cake_category_path(@cake_category), "post" do

      assert_select "input#cake_category_title[name=?]", "cake_category[title]"
    end
  end
end
