require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :user_id => 1,
      :name => "MyString",
      :position => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input[name=?]", "contact[user_id]"

      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[position]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[phone]"
    end
  end
end
