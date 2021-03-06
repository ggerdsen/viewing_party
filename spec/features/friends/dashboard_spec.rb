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

    it "Has an 'Add Friend' button" do
      visit '/dashboard'
      within(".friends") do
        expect(page).to have_field("Friend's Email")
        expect(page).to have_button("Add Friend")
      end
    end

    it "Can add friends and see those friends in the user dashboard friend's section" do
      visit '/dashboard'
      friend_user = create(:user)

      within(".friends") do
        expect(page).to have_content("You currently have no friends.")
        fill_in :friends_email, with: "#{friend_user.email}"
        click_on "Add Friend"
      end

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content(friend_user.name)
    end

    it "Can not add a friend that does not exist in the database" do
      visit '/dashboard'
      fake_user = "woohoo@email.com"

      within(".friends") do
        fill_in :friends_email, with: fake_user
        click_on "Add Friend"
      end

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Unable to add friend.')
    end
    
    it "Can not add myself as a friend" do
      visit '/dashboard'

      within(".friends") do
        fill_in :friends_email, with: @regular_user.email
        click_on "Add Friend"
      end

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Unable to add friend.')
    end
  end
end
