require 'rails_helper'

RSpec.feature "Visitor can login", type: :feature, js: true do
  before :each do
    @user = User.create!(
      given_name: "Jonathan",
      surname: "Cheng",
      email: "test@test.ca",
      password: "password",
      password_confirmation: "password"
    )
  end

  scenario "should have login and register links in nav when logged out" do
    # ACT
    visit root_path

    # VERIFY
    expect(page).to have_content('Login')
    expect(page).to have_content('Register')

    # DEBUG
    save_screenshot
  end

  scenario "should go to login page when clicking on login" do
    # ACT
    visit root_path
    click_on 'Login'

    # VERIFY
    expect(page).to have_css('.login-index')

    # DEBUG
    save_screenshot
  end

  scenario "should show logout link in nav when logged in as a user" do
    # ACT
    visit root_path
    click_on 'Login'
    fill_in 'login-email', with: "test@test.ca"
    fill_in 'login-password', with: "password"
    click_on 'Submit'

    # VERIFY
    expect(page).to have_content('Logout')

    # DEBUG
    save_screenshot
  end
end
