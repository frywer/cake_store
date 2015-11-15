require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :title => "MyString",
      :image => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do

      assert_select "input#tweet_title[name=?]", "tweet[title]"

      assert_select "input#tweet_image[name=?]", "tweet[image]"

      assert_select "textarea#tweet_content[name=?]", "tweet[content]"
    end
  end
end
