require 'rails_helper'

RSpec.describe "tweets/new", type: :view do
  before(:each) do
    assign(:tweet, Tweet.new(
      :title => "MyString",
      :image => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new tweet form" do
    render

    assert_select "form[action=?][method=?]", tweets_path, "post" do

      assert_select "input#tweet_title[name=?]", "tweet[title]"

      assert_select "input#tweet_image[name=?]", "tweet[image]"

      assert_select "textarea#tweet_content[name=?]", "tweet[content]"
    end
  end
end
