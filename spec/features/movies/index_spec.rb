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

    it "I can see the top 40 movies by average rating" do
      VCR.use_cassette("top_40", allow_playback_repeats: true) do
        visit "/discover"
        click_on "Find Top Rated Movies"

        expect(current_path).to eq("/movies")
        expect(page).to have_content("Gabriel's Inferno Part II")
      end
    end
      
    it "I can search for a movie by keyword" do
      VCR.use_cassette("search_by_keyword", allow_playback_repeats: true) do
        visit "/discover"
        expect(page).to have_button("Find Movies")
        fill_in :search, with: "sunset"
        click_on "Find Movies"
        expect(current_path).to eq("/movies")
      
        expect(page).to have_content("sunset")
      end
    end
  end
end