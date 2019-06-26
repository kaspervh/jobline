require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :user_id => 2,
        :name => "Name",
        :position => "Position",
        :email => "Email",
        :phone => "Phone"
      ),
      Contact.create!(
        :user_id => 2,
        :name => "Name",
        :position => "Position",
        :email => "Email",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
