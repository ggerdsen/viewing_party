require 'rails_helper'

RSpec.describe PartyGuest, type: :model do
  describe "Relationships" do
    it { should belong_to :party }
    it { should belong_to :guest }
  end

  describe "Validations" do
    it { should validate_presence_of :party_id }
    it { should validate_presence_of :guest_id }
  end
end
