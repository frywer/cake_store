require 'rails_helper'

RSpec.describe "cake_categories/index", type: :view do
  before(:each) do
    assign(:cake_categories, [
      CakeCategory.create!(
        :title => "Title"
      ),
      CakeCategory.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of cake_categories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
