require "rails_helper"

RSpec.describe "Dashboard" do
  describe "As an authenticated user" do
    before :each do
      @regular_user = create(:user)
      visit "/"
      fill_in :email, with: "#{@regular_user.email}"
      fill_in :password, with: "#{@regular_user.password}"
      click_on "Log In"
    end

    it "Has a 'Add Friend' button" do
      visit '/dashboard'
      within(".friends") do
        expect(page).to have_field("Friend's Email")
        expect(page).to have_button("Add Friend")
        expect(page).to have_content("You currently have no friends.")
      end
    end
  end
end
