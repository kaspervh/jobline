require 'rails_helper'

RSpec.describe "user_settings/show.html.erb", type: :view do
  before(:each) do
    @user = create(:user)
    login(@user)
    visit user_settings_show_path
  end

  scenario 'expect to be on user settings page' do 
    expect(current_path).to eq user_settings_show_path
  end

  scenario 'expect menu points' do 
    expect_page_content(['Rediger mine oplysninger', 'Skift mit kodeord', 'Tilføj kontak person', 'Bruger indstillinger'])
  end

  scenario 'change user firstname' do
    within('.colapse-box', match: :first) do 
      find('.colapse-header').click
      fill_in 'user[first_name]', with: 'diller'
      click_on 'Gem'
    end
    fail if User.first.first_name != 'diller'
  end 

  scenario 'create new contact' do 
    within all('.colapse-box').last do 
      find('.colapse-header').click
      fill_in 'contact[name]', with: 'Birger'
      fill_in 'contact[position]', with: 'Læge'
      fill_in 'contact[email]', with: 'bl@example.com'
      fill_in 'contact[phone]', with: '88888888'
      click_on 'Gem'
    end
    visit root_path
    expect_page_content(['Læge - Birger', 'Slet kontakt'])
  end
end
