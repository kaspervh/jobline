require 'rails_helper'

RSpec.describe "user_settings/show.html.erb", type: :view do
  before(:each) do
    @user = create(:user)
    #login(@user)
    #visit user_settings_show_path
  end

  scenario 'expect to be on user_settings' do
    expect(current_path).to eq user_settings_path
  end 
end
