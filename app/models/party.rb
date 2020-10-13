class Party < ApplicationRecord
  belongs_to :user
  has_many :party_guests, dependent: :destroy
  has_many :guests, through: :party_guests

  validates_presence_of :movie_title, :party_duration, :date, :start_time
end
