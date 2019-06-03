require 'rails_helper'

RSpec.describe 'sign in user', type: :feature do
  before(:each) do
    @user = create(:user)
    visit login_path
  end

  scenario 'check if user exists' do
    fail if User.blank?
    fail if User.last.first_name != 'john'
  end

  scenario 'will fail if signin button is pressed' do 
    click_on 'Log ind'
    expect(current_path).to eq login_path
  end 

  scenario 'will sign in' do 
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'Log ind'
    expect(current_path).to eq root_path
  end

  scenario 'sign in with false user' do 
    fill_in 'email', with: 'sørentveskæg@example.com'
    fill_in 'password', with: 'diller'
    click_on 'Log ind'
    expect(current_path).to eq login_path
  end
end