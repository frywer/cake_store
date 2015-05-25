require 'rails_helper'

RSpec.describe "paintings/edit", type: :view do
  before(:each) do
    @painting = assign(:painting, Painting.create!(
      :name => "MyString",
      :gallery => nil
    ))
  end

  it "renders the edit painting form" do
    render

    assert_select "form[action=?][method=?]", painting_path(@painting), "post" do

      assert_select "input#painting_name[name=?]", "painting[name]"

      assert_select "input#painting_gallery_id[name=?]", "painting[gallery_id]"
    end
  end
end
