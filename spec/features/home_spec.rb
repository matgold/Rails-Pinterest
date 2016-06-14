require 'rails_helper'

feature 'visit homepage' do
   scenario 'the visitor sees welcome text' do
      visit 'home/index'
      expect(page).to have_text('Welcome !!!')
   end
end