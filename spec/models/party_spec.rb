require 'rails_helper'
RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :party_guests }
    it { should have_many(:guests).through(:party_guests) }
  end

  describe "validations" do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :party_duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end
end
