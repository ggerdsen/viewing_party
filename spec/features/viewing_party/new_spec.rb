require "rails_helper"

RSpec.describe "Viewing Party New Page" do
  describe "As an authenticated user" do
    before :each do
      @regular_user = create(:user)
      visit "/"
      fill_in :email, with: "#{@regular_user.email}"
      fill_in :password, with: "#{@regular_user.password}"
      click_on "Log In"
    end

    it "I see a button to create a new viewing party form" do
      VCR.use_cassette("new_viewing_party_form") do

        visit "/discover"
        click_on "Find Top Rated Movies"

        expect(current_path).to eq("/movies")
        expect(page).to have_content("The Shawshank Redemption")

        click_on("The Shawshank Redemption")
        click_on("Create Viewing Party for Movie")
        expect(current_path).to eq("/viewing_party/new")
      end
    end
  end
end
