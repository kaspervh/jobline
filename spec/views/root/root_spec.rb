require 'rails_helper'

RSpec.describe 'test root page', type: :feature do
  before(:each) do
    @user = create(:user)
    login(@user)
  end

  scenario 'expect to be on dashboard page when loged in' do 
    expect(current_path).to eq root_path
    expect_page_content(['Dashboard', 'Jobline', 'Job', 'Online cv', 'Indstillinger', 'Log ud'])
  end

  scenario 'click on job and see sub menu fields' do 
    find('.nav-button', text: 'Job').click
    expect_page_content(['Check jobbank', 'Repporter Jobsøgning'])
  end

  scenario 'click on online cv and see sub menu fields' do 
    find('.nav-button', text: 'Online cv').click
    expect_page_content(['online cv', 'Rediger cv', 'Se cv'])
  end

  scenario 'clik on indstillinger and  see sub menu fields' do 
    open_settings
    expect_page_content(['Rediger oplysninger', 'Skift Kodeord', 'Tilføj kontaktperson'])
  end

  scenario 'open modal for user settings' do 
    open_settings
    find('.sub-nav-button', text: 'Rediger oplysninger').click
    expect_page_content(['Rediger brugeroplysninger'])
  end

  scenario 'change users username' do 
    open_settings
    find('.sub-nav-button', text: 'Rediger oplysninger').click
    fill_in 'user[first_name]', with: 'diller'
    click_on 'Gem ændringer'
    fail if User.first.first_name != 'diller'
  end

  scenario 'open modal for change password' do 
    open_settings
    find('.sub-nav-button', text: 'Skift Kodeord').click
    expect_page_content(['Skift kodeord'])
  end

  scenario 'change users username' do 
    open_settings
    find('.sub-nav-button', text: 'Skift Kodeord').click
    fill_in 'user[password]', with: 'diller'
    fill_in 'user[password_confirmation]', with: 'diller'

    click_on 'Gem nyt kodeord'
  end

  scenario 'open add contacts modal' do 
    open_settings
    find('.sub-nav-button', text: 'Tilføj kontaktperson').click
    expect_page_content(['Ny kontaktperson'])
  end

  scenario 'make new contact' do 
    open_settings
    find('.sub-nav-button', text: 'Tilføj kontaktperson').click
    fill_in 'contact[name]', with: 'Birger'
    fill_in 'contact[position]', with: 'Læge'
    fill_in 'contact[email]', with: 'bl@example.com'
    fill_in 'contact[phone]', with: '88888888'
    click_on 'Gem kontakt'
    expect_page_content(['Læge - Birger', 'Slet kontakt'])
  end



  #helper methods 
  def open_settings
    find('.nav-button', text: 'Indstillinger').click
  end
  
end
