require "rails_helper"

RSpec.describe "Dashboard" do
  describe "As an authenticated user" do
    before :each do
      # @regular_user = User.create!(name: "Larry", email: "regular_user@email.com", password: "123")
      @regular_user = create(:user)
      visit "/"
      fill_in :email, with: "#{@regular_user.email}"
      fill_in :password, with: "#{@regular_user.password}"
      click_on "Log In"
    end

    xit "sees a welcome message and a button to discover movies" do
      visit "/discover"
      click_on "Discover Movies"
    end
  end
end
