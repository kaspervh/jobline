require 'rails_helper'

RSpec.describe 'create user', type: :feature do
  before(:each) do
    visit signup_path
  end

  scenario 'wont save user if form is not filled' do
    end_test
  end

  scenario 'wont save user if only first name is filled id ' do
    fill_in 'user[first_name]', with: 'john'
    end_test
  end

  scenario 'wont save if only last name is filled in' do
    fill_in 'user[last_name]', with: 'doe'
    end_test
  end

  scenario 'wont save if only email is filled in' do
    fill_in 'user[email]', with: 'johndoe@example.com'
    end_test
  end

  scenario 'wont save if only passwords are filled in' do
    fill_in 'user[password]', with: 'diller'
    fill_in 'user[password_confirmation]', with: 'diller'
    end_test
  end

  scenario 'wont save if first_name & last_name is filled in' do
    fill_in 'user[first_name]', with: 'john'
    fill_in 'user[last_name]', with: 'doe'
    end_test
  end

  scenario 'wont save if first and last name and email is filled in' do
    fill_in 'user[first_name]', with: 'john'
    fill_in 'user[last_name]', with: 'doe'
    fill_in 'user[email]', with: 'johndoe@example.com'
    end_test
  end

  scenario 'will save if all fields are filled' do
    fill_in 'user[first_name]', with: 'john'
    fill_in 'user[last_name]', with: 'doe'
    fill_in 'user[email]', with: 'johndoe@example.com'
    fill_in 'user[password]', with: 'diller'
    fill_in 'user[password_confirmation]', with: 'diller'
    click_on 'Opret'
    expect(current_path).to eq welcome_path
    fail if User.last.first_name != 'john'
  end

  # HELPER METHODS

  def end_test
    click_on 'Opret'
    expect(current_path).to eq signup_path
  end
end
