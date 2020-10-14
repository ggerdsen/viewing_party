require "rails_helper"

RSpec.describe "Movie Show Page" do
  describe "As an authenticated user" do
    before :each do
      @regular_user = create(:user)
      visit "/"
      fill_in :email, with: "#{@regular_user.email}"
      fill_in :password, with: "#{@regular_user.password}"
      click_on "Log In"
    end

    xit "I can access a movie show page from the movie index by clicking on the movie name", :vcr do
      VCR.use_cassette("movie_info", allow_playback_repeats: true, :record => :new_episodes) do
        visit "/discover"
        click_on "Find Top Rated Movies"

        expect(current_path).to eq("/movies")
        expect(page).to have_content("Gabriel's Inferno Part II")
        click_link("Gabriel's Inferno Part II")
        
        # NEED TO FIGURE OUT A WAY TO FIND THE MOVIE ID HERE WITH VCR SO WE CAN CHECK PATHS
        
        expect(page).to have_content("Vote Average: 8.9")
        expect(page).to have_content("Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?")
      end
    end
  end
end