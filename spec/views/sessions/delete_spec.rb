RSpec.describe 'sign in user', type: :feature do
  before(:each) do
    @user = create(:user)
    visit login_path
  end

  scenario 'login and sign out' do 
    login
    click_on 'Log ud'
    expect(current_path).to eq welcome_path
  end

  #helper methods

  def login
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'Log ind'
    expect(current_path).to eq root_path
  end
end