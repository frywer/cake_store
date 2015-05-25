require 'rails_helper'

RSpec.describe "paintings/index", type: :view do
  before(:each) do
    assign(:paintings, [
      Painting.create!(
        :name => "Name",
        :gallery => nil
      ),
      Painting.create!(
        :name => "Name",
        :gallery => nil
      )
    ])
  end

  it "renders a list of paintings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
