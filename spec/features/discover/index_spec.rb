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

    it "sees a welcome message and a button to discover movies" do
      VCR.use_cassette("top_40", allow_playback_repeats: true, :record => :new_episodes) do
        visit "/discover"
        click_on "Find Top Rated Movies"
        
        expect(current_path).to eq("/movies")
        expect(page).to have_content("Gabriel's Inferno Part II")
      end
    end
  end
end
