require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :user_id => 1,
      :name => "MyString",
      :position => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[user_id]"

      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[position]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[phone]"
    end
  end
end
