require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :user_id => 2,
      :name => "Name",
      :position => "Position",
      :email => "Email",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
  end
end
