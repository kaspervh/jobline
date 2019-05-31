require 'rails_helper'

RSpec.describe 'test root welcome page', type: :feature do
  before(:each) do
    visit root_path
  end

  scenario 'visit page ', js: true do
    expect_page_content(['Jobline', 'Log ind', 'Jobsøgning gjort enkelt', 'Tilmæld som jobsøgende'])
    dont_expect_page_content(['Søg og ansøg på samme tid'])
  end

  scenario 'click the right-btn and see the page changing 3 times', js: true do
    3.times { find('.right-btn').click }
    expect_page_content(['Giv sagsbehandleren overblik'])
  end

  scenario 'go right and then left' do
    3.times { find('.right-btn').click }
    2.times { find('.left-btn').click }
    expect_page_content(['Søg og ansøg på samme tid'])
  end

  scenario 'click signup button and visit signup path' do
    click_on 'Tilmæld som jobsøgende'
    expect(current_path).to eq signup_path
  end

  scenario 'click login button and go to sign in path' do
    click_on 'Log ind'
    expect(current_path).to eq login_path
  end
end
