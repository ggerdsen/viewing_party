class PartyGuest < ApplicationRecord
  belongs_to :party
  belongs_to :guest, class_name: 'User'

  validates :party_id, :guest_id, presence: true
end
