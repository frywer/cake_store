require 'rails_helper'

RSpec.describe "paintings/new", type: :view do
  before(:each) do
    assign(:painting, Painting.new(
      :name => "MyString",
      :gallery => nil
    ))
  end

  it "renders new painting form" do
    render

    assert_select "form[action=?][method=?]", paintings_path, "post" do

      assert_select "input#painting_name[name=?]", "painting[name]"

      assert_select "input#painting_gallery_id[name=?]", "painting[gallery_id]"
    end
  end
end
