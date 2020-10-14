class Party < ApplicationRecord
  belongs_to :user
  has_many :party_guests, dependent: :destroy
  has_many :guests, through: :party_guests

  validates :movie_title, :party_duration, :date, :start_time, presence: true
end
