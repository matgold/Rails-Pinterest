require "rails_helper"
require 'capybara/rails'

feature 'full test' do
   let(:user) {FactoryGirl.create(:user)}
   
   def fill_in_signin_fields
      # fill_in "hacker[name]", with: hacker.name
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Zaloguj"
   end
   
   scenario 'full test' do
      visit root_path
      click_link "Logowanie"
      fill_in_signin_fields
      expect(page).to have_content("Zostałeś pomyślnie zalogowany.")
   
      visit '/'
      click_link "Nowy pin"
      #  attach_file('Image', "spec/files/images/coffee.jpg")
      fill_in "pin[description]", with: "dadada"
      click_button 'Create Pin'
      expect(page).to have_content("Pin utworzony pomyślnie.")
      #  expect(page).to have_css("img[src*='coffee.jpg']")
      
      fill_in "comment[description]", with: "dadada"
      click_button "Dodaj komentarz"
      expect(page).to have_content("Komentarz dodany pomyślnie.")
      
      first(:link, "Usuń").click
      
      click_link "Wylogowanie"
  end
end
