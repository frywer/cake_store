require 'rails_helper'

RSpec.describe "email_forms/show", type: :view do
  before(:each) do
    @email_form = assign(:email_form, EmailForm.create!(
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :subject => "Subject",
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
  end
end
