require "rails_helper"

RSpec.describe "As an visitor, when I visit the root path, " do
  it "I see a welcome message" do
    visit "/"
    expect(page).to have_content("Welcome to Viewing Party!")
  end
  
  it "I see a brief description of the application" do
    visit "/"
    expect(page).to have_content("Find a movie, invite some friends, watch movies together!")
  end
  
  it "I see a button to login" do
    regular_user = User.create!(name: "Larry", email: "regular_user@email.com", password: "123")

    visit "/"
    
    fill_in :email, with: "#{regular_user.email}"
    fill_in :password, with: "#{regular_user.password}"

    click_on "Log In"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome #{regular_user.name}!")
    
    visit "/"
    expect(page).to_not have_button("Log In")
  end
  
  xit "I see a link to register" do
    visit "/"
    within '.topnav' do
      expect(page).to have_link("Register")
    end
  end
end