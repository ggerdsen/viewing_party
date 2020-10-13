require "rails_helper"
RSpec.describe User, :type => :model do
  describe 'relationships' do
    it { should have_many :friendships }
    it { should have_many :parties }
    it { should have_many(:friends).through(:friendships) }
  end

  it "is valid with valid attributes" do
    user1 = create(:user)
    expect(user1).to be_valid
  end
end
