require 'spec_helper_integration'

class ApplicationTest < ActionDispatch::IntegrationTest
  describe "Users can signup and login", js: true do
    let(:email) { "me@me.com" }
    let(:username) { "me_username" }
    let(:password) { "PassWord!" }

    before do
      visit '/'
    end

    it 'using the modal forms' do

      within 'nav.navbar' do
        click_button "Sign Up"
      end

      within 'form#signup-modal' do
        fill_in "Email", with: email
        fill_in "Username", with: username
        fill_in "Password", with: password
        fill_in "Confirm", with: password
        click_button "Sign Up"
      end

      # TODO: assert modal closed
      # TODO: add database cleaner to fix validation issue
      # TODO: assert confirmation email queued
      # TODO: clicking confirmation link activates user

      within '.navbar' do
        click_button "Log In"
      end

      within 'form#login-modal' do
        fill_in "Email", with: email
        fill_in "Password", with: password
        click_button "Log In"
      end

      # TODO: assertions
    end
  end
end
