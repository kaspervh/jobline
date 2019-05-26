require 'rails_helper'

RSpec.describe 'test root welcome page', type: :feature  do 
  before(:each) do 
    visit root_path
  end 


  scenario 'visit page ', js: :true do 
    expect_page_content( ['Jobline', 'Log ind', 'Jobsøgning gjort enkelt', 'Tilmæld som jobsøgende'] )
    dont_expect_page_content(['Søg og ansøg på samme tid'])
  end
end