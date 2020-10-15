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

    it "When I click the viewing_party button I am redirected and see a form" do
      VCR.use_cassette("click_viewing_party_button") do

        visit "/discover"
        click_on "Find Top Rated Movies"

        expect(current_path).to eq("/movies")
        expect(page).to have_content("The Shawshank Redemption")

        click_on("The Shawshank Redemption")
        click_on("Create Viewing Party for Movie")
        expect(current_path).to eq("/viewing_party/new")

        expect(page).to have_content("The Shawshank Redemption")
        expect(page).to have_selector("#party_duration")
        expect(page).to have_selector("#date")
        expect(page).to have_selector("#start_time")
      end
    end

    xit "I can fill in the form" do
      VCR.use_cassette("create_viewing_party") do

        visit "/discover"
        click_on "Find Top Rated Movies"

        expect(current_path).to eq("/movies")
        expect(page).to have_content("The Shawshank Redemption")

        click_on("The Shawshank Redemption")
        click_on("Create Viewing Party for Movie")
        expect(current_path).to eq("/viewing_party/new")

        expect(page).to have_content("The Shawshank Redemption")
        expect(page).to have_selector("#party_duration")
        expect(page).to have_selector("#date")
        expect(page).to have_selector("#start_time")

        fill_in :party_duration, with: 155
        fill_in :date, with: "2020/10/14"
        fill_in :start_time, with: "7:35"
        click_on("Create Party")
      end
    end
  end
end
