FactoryGirl.define do
   factory :user do
      name { FFaker::Name.first_name }
      email { FFaker::Internet.email }
      # password { Devise.friendly_token.first(8)}
      password { "password" }
      password_confirmation { "password" }
   end
end