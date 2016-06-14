require "rails_helper"
require 'capybara/rails'

feature 'signing in' do
   let(:user) {FactoryGirl.create(:user)}
   
   def fill_in_signin_fields
      # fill_in "hacker[name]", with: hacker.name
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Zaloguj"
   end
   
   scenario 'visiting the site to sign in' do
      visit root_path
      click_link "Logowanie"
      fill_in_signin_fields
      expect(page).to have_content("Zostałeś pomyślnie zalogowany.")
   end
end