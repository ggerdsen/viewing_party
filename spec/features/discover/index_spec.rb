require "rails_helper"

RSpec.describe "Discover" do
  describe "As an authenticated user" do
    before :each do
      @regular_user = create(:user)
      visit "/"
      fill_in :email, with: "#{@regular_user.email}"
      fill_in :password, with: "#{@regular_user.password}"
      click_on "Log In"
    end

    it "sees a welcome message and a button to discover movies", :vcr do
        visit "/discover"
        click_on "Find Top Rated Movies"
    end
  end
end
