require 'rails_helper'

RSpec.describe "email_forms/index", type: :view do
  before(:each) do
    assign(:email_forms, [
      EmailForm.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :subject => "Subject",
        :message => "MyText"
      ),
      EmailForm.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :subject => "Subject",
        :message => "MyText"
      )
    ])
  end

  it "renders a list of email_forms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
