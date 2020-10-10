require "rails_helper"

RSpec.describe "Movie Index Page" do
  describe "As an authenticated user" do
    before :each do
      # @regular_user = User.create!(name: "Larry", email: "regular_user@email.com", password: "123")
      @regular_user = create(:user)
      visit "/"
      fill_in :email, with: "#{@regular_user.email}"
      fill_in :password, with: "#{@regular_user.password}"
      click_on "Log In"
    end

    it "I can see the top 40 movies by average rating", :vcr do
      
      visit "/discover"
      click_on "Find Top Rated Movies"

      expect(current_path).to eq("/movies")
      expect(page).to have_content("Gabriel's Inferno Part II")
      
    end
  end
end