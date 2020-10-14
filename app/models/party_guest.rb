class PartyGuest < ApplicationRecord
  belongs_to :party
  belongs_to :guest, class_name: 'User'

  validates_presence_of :party_id, :guest_id
end
