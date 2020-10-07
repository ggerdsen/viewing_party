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
    visit "/"
    within '.topnav' do
      expect(page).to have_button("Log In")
    end
  end
  
  it "I see a link to register" do
    visit "/"
    within '.topnav' do
      expect(page).to have_link("Register")
    end
  end
end