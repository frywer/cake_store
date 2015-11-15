require 'rails_helper'

RSpec.describe "email_forms/new", type: :view do
  before(:each) do
    assign(:email_form, EmailForm.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :subject => "MyString",
      :message => "MyText"
    ))
  end

  it "renders new email_form form" do
    render

    assert_select "form[action=?][method=?]", email_forms_path, "post" do

      assert_select "input#email_form_name[name=?]", "email_form[name]"

      assert_select "input#email_form_email[name=?]", "email_form[email]"

      assert_select "input#email_form_phone[name=?]", "email_form[phone]"

      assert_select "input#email_form_subject[name=?]", "email_form[subject]"

      assert_select "textarea#email_form_message[name=?]", "email_form[message]"
    end
  end
end
