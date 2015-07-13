require 'rails_helper'

RSpec.describe "cake_categories/show", type: :view do
  before(:each) do
    @cake_category = assign(:cake_category, CakeCategory.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
