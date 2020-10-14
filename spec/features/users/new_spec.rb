require "rails_helper"

RSpec.describe "As an visitor, when I visit the root path, " do
  it "I see a link to register as a new user" do
    visit "/"
    expect(page).to have_content("New to Viewing Party? Register Here")
    
    click_link "New to Viewing Party? Register Here"
    
    expect(current_path).to eq("/register")
    
    fill_in :name, with: "Larry"
    fill_in :email, with: "regular_user@email.com"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"

    within '.register' do
      click_on "Register"
    end
    
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome Larry!")
    expect(page).to have_content("You are now registered and logged in as Larry")
    visit "/"
    expect(page).to_not have_button("Log In")
  end
  
  it "Does not allow me to register if my password and confirmation do not match" do
    visit "/register"
    
    fill_in :name, with: "Barry"
    fill_in :email, with: "other_user@email.com"
    fill_in :password, with: "wrong"
    fill_in :password_confirmation, with: "right"
    
    within '.register' do
      click_on "Register"
    end
    
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end