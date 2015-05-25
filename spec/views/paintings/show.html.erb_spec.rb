require 'rails_helper'

RSpec.describe "paintings/show", type: :view do
  before(:each) do
    @painting = assign(:painting, Painting.create!(
      :name => "Name",
      :gallery => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
